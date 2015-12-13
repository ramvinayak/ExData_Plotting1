householdData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows = 75000, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

householdData$Date <- as.Date(householdData$Date, format="%d/%m/%Y")

householdSubset <- subset(householdData, Date >= '2007-02-01' & Date <= '2007-02-02' )


householdSubset$dateTime = format(as.POSIXct(paste(householdSubset$Date, householdSubset$Time)), "%Y-%m-%d %H:%M:%S")

householdSubset$dateTime <- strptime(householdSubset$dateTime, format = "%Y-%m-%d %H:%M:%S")

par(mfrow = c(2,2) , mar = c(4,4,2,2))

##top left 

with(householdSubset, plot(dateTime,Global_active_power,type = "l", ylab = "Global Active Power"))

## top right
with(householdSubset, plot(dateTime,Voltage,type = "l", ylab = "Voltage"))

## Bottom Left 
with(householdSubset,plot(dateTime,Sub_metering_1,type = "n", ylab = "Energy sub metering"))

with(householdSubset,points(dateTime,Sub_metering_1,type = "l", col = "black"))
with(householdSubset,points(dateTime,Sub_metering_2,type = "l", col = "red"))
with(householdSubset,points(dateTime,Sub_metering_3,type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2" , "Sub_metering_3") , lwd = 2 , lty = c(1,1,1) , cex = 0.4 , col = c("black", "red","blue"))


##Bottom Right 
with(householdSubset, plot(dateTime,Global_reactive_power,type = "l", ylab = "Global Reactive Power"))
dev.copy(png,"plot4.png",width = 480, height = 480)

dev.off()