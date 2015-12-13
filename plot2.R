householdData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows = 75000, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

householdData$Date <- as.Date(householdData$Date, format="%d/%m/%Y")

householdSubset <- subset(householdData, Date >= '2007-02-01' & Date <= '2007-02-02' )


householdSubset$dateTime = format(as.POSIXct(paste(householdSubset$Date, householdSubset$Time)), "%Y-%m-%d %H:%M:%S")

householdSubset$dateTime <- strptime(householdSubset$dateTime, format = "%Y-%m-%d %H:%M:%S")


##plot(householdSubset$dateTime , householdSubset$Global_active_power,type = "l", xlab = "Date Time", ylab = "Global Active Power (kilowatts)")

with(householdSubset, plot(dateTime,Global_active_power,type = "l",xlab = "Date Time", ylab = "Global Active Power (kilowatts)"))


dev.copy(png,"plot2.png",width = 480, height = 480)

dev.off()


