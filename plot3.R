householdData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows = 75000, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

householdData$Date <- as.Date(householdData$Date, format="%d/%m/%Y")

householdSubset <- subset(householdData, Date >= '2007-02-01' & Date <= '2007-02-02' )


householdSubset$dateTime = format(as.POSIXct(paste(householdSubset$Date, householdSubset$Time)), "%Y-%m-%d %H:%M:%S")

householdSubset$dateTime <- strptime(householdSubset$dateTime, format = "%Y-%m-%d %H:%M:%S")


##plot(householdSubset$dateTime , householdSubset$Global_active_power,type = "n", xlab = "Date Time", ylab = "Global Active Power (kilowatts)")
with(householdSubset,plot(dateTime,Sub_metering_1,type = "n", ylab = "Energy sub metering"))

with(householdSubset,points(dateTime,Sub_metering_1,type = "l", col = "black"))
with(householdSubset,points(dateTime,Sub_metering_2,type = "l", col = "red"))
with(householdSubset,points(dateTime,Sub_metering_3,type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2" , "Sub_metering_3") , lwd = 2 , lty = c(1,1,1) , cex = 0.75 , col = c("black", "red","blue"))

dev.copy(png,"plot3.png",width = 480, height = 480)

dev.off()
