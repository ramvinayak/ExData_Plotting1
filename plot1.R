householdData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows = 75000, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

householdData$Date <- as.Date(householdData$Date, format="%d/%m/%Y")

householdSubset <- subset(householdData, Date >= '2007-02-01' & Date <= '2007-02-02' )

hist(householdSubset$Global_active_power,main = "Global Active Power", xlab = "Global Active Power(kilowatts)", col = "red")

dev.copy(png,"plot1.png",width = 480, height = 480)

dev.off()
