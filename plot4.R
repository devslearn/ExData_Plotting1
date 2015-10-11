## Assumption
## The data file household_power_consumption.txt is assumed to be extracted already and is available in 
## the "data" folder that is present in the current folder where this R file is present

# read the data into the hhpcData data frame for further processing
hhpcData <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors=FALSE)

# filter those records that have the dates 2007-02-01 and 2007-02-02
# as a validation, the number of observations that we should be having should be 2880
# that is 2 days x 24 hrs/ day x 60 mins / hr = 2 * 24 * 60 = 2880 observations
requiredData <- hhpcData[hhpcData$Date %in% c("1/2/2007", "2/2/2007"),]

# paste date and time, convert to POSIXlt format and store it into variable DateNTime
requiredData$DateNTime <- strptime(paste(requiredData$Date, requiredData$Time), format="%d/%m/%Y %H:%M:%S")

# plot to png graphic device
png("plot4.png", width=480, height=480)

# set the number of rows to 2 and cols to 2 for creating a matrix of two rows by two cols plots
par(mfrow=c(2,2))

# plot 1 at row 1 col 1
plot(requiredData$DateNTime, requiredData$Global_active_power, type="l", xlab="", ylab="global Active Power")

# plot 2 at row 1 col 2
plot(requiredData$DateNTime, requiredData$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot 3 at row 2 col 1
plot(requiredData$DateNTime, requiredData$Sub_metering_1, type="l", xlab="", ylab="Energy Sub metering")

# add additional elements to the plot
lines(requiredData$DateNTime, requiredData$Sub_metering_2, type="l", col="red")
lines(requiredData$DateNTime, requiredData$Sub_metering_3, type="l", col="blue")

# add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n")

# plot 4 at row 2 col 2
plot(requiredData$DateNTime, requiredData$Global_reactive_power, type="l", xlab="datetime", ylab="global_reactive_power", cex=0.1)

# shut the device
dev.off()
