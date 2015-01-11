#Get full data set
household_power_consumption <- read.csv("./Dataset/household_power_consumption.txt", sep=";", na.strings="?")

# Convert Date and Time to respective objects and formats
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")

#Get subset of data
dataSubset <- subset(household_power_consumption, household_power_consumption$Date >= as.Date("2007-02-01") & household_power_consumption$Date <= as.Date("2007-02-02"))

# Remove full dataset
rm(household_power_consumption)

# Create column DateTime
datetime <- paste(dataSubset$Date, dataSubset$Time)
dataSubset$Datetime <- as.POSIXct(datetime)

# Crate muntiple lines plot
with(dataSubset, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save to png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
