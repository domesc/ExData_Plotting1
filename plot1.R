#Get full data set
household_power_consumption <- read.csv("./Dataset/household_power_consumption.txt", sep=";", na.strings="?")

# Convert Date and Time to respective objects and formats
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")

# Get subset of data
dataSubset <- subset(household_power_consumption, household_power_consumption$Date >= as.Date("2007-02-01") & household_power_consumption$Date <= as.Date("2007-02-02"))

# Remove full dataset
rm(household_power_consumption)

# Create column DateTime
datetime <- paste(dataSubset$Date, dataSubset$Time)
dataSubset$Datetime <- as.POSIXct(datetime)

# Show the histogram
hist(dataSubset$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
