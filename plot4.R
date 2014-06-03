# Note: This code assumes that the zip file has been downloaded and unzipped,
# and that household_power_consumption.txt has been placed in the working
# directory.

# read in the data
classes <- c(rep("character", 2), rep("numeric", 7))
power.all <- read.table("household_power_consumption.txt", header=TRUE,
                        sep=";", colClasses=classes, na.strings="?")

# subset the appropriate days
power <- power.all[power.all$Date=="1/2/2007"|power.all$Date=="2/2/2007", ]

# create a new variable "DateTime"
datetime <- paste(power$Date, power$Time)
power$DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

# Plot 4
png(file="plot4.png")
par(mfrow=c(2,2))
plot(power$DateTime, power$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")
plot(power$DateTime, power$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(power$DateTime, power$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(power$DateTime, power$Sub_metering_2, col="red")
lines(power$DateTime, power$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(power$DateTime, power$Global_reactive_power, type="l", xlab="datetime",
     ylab="Global_reactive_power")
dev.off()
