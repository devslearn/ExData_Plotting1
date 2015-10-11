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
png("plot2.png", width=480, height=480)
plot(requiredData$DateNTime, requiredData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# shut the device
dev.off()