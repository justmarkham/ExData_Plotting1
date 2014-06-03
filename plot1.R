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

# Plot 1
png(file="plot1.png")
hist(power$Global_active_power, xlab="Global Active Power (kilowatts)",
     ylab="Frequency", main="Global Active Power", col="red")
dev.off()
