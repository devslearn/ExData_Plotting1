## Assumption
## The data file household_power_consumption.txt is assumed to be extracted already and is available in 
## the "data" folder that is present in the current folder where this R file is present

# read the data into the hhpcData data frame for further processing
hhpcData <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors=FALSE)

# convert the Date variable from character to Date
hhpcData$Date <- as.Date(hhpcData$Date, "%d/%m/%Y")

# paste date and time and store it into variable DateNTime
hhpcData$DateNTime <- paste(hhpcData$Date, hhpcData$Time)
class(hhpcData$DateNTime)

# convert the Date variable from character to Date
hhpcData$DateNTime <- as.Date(hhpcData$DateNTime)

# filter those records that have the dates 2007-02-01 and 2007-02-02
# as a validation, the number of observations that we should be having should be 2880
# that is 2 days x 24 hrs/ day x 60 mins / hr = 2 * 24 * 60 = 2880 observations
requiredData <- filter(hhpcData, DateNTime >= "2007-02-01 00:00:00", DateNTime <= "2007-02-02 00:00:00")

# plot to png graphic device
png("plot1.png", width=480, height=480)
hist(requiredData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# shut the device
dev.off()