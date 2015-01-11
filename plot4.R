#Get full data set
household_power_consumption <- read.csv("./Dataset/household_power_consumption.txt", sep=";", na.strings="?")

# Convert Date and Time to respective objects and formats
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")

#Get subset of data
dataSubset <- subset(household_power_consumption, 
                     household_power_consumption$Date >= as.Date("2007-02-01") & 
                     household_power_consumption$Date <= as.Date("2007-02-02"))

# Remove full dataset
rm(household_power_consumption)

# Create column DateTime
datetime <- paste(dataSubset$Date, dataSubset$Time)
dataSubset$Datetime <- as.POSIXct(datetime)

# create multiple plots in the same window
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dataSubset, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l",
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",cex = 0.7,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l",
       ylab="Global_reactive_power",xlab="datetime")
})

# Save to png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()