
# Open libraries
library(readr)
library(dplyr)
library(datasets)

#  Prepare the dataset
## Assume that data file is in the same directory

hhdataFile <- "./household_power_consumption.txt"
hhdata <- read.table(hhdataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plotdata <- hhdata[hhdata$Date %in% c("1/2/2007","2/2/2007") , ]
datetime <- strptime(paste(plotdata$Date, plotdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(plotdata$Global_active_power)
subMeter1 <- as.numeric(plotdata$Sub_metering_1)
subMeter2 <- as.numeric(plotdata$Sub_metering_2)
subMeter3 <- as.numeric(plotdata$Sub_metering_3)
globalReactivePower <- as.numeric(plotdata$Global_reactive_power)
voltage <- as.numeric(plotdata$Voltage)


# Generate the plot 3
png("plot3.png", width = 480, height = 480)
plot(datetime, subMeter1, type = "l", xlab = "", ylab = "Engery Sub Meter Reading")
lines(datetime, subMeter2, type = "l", col = "red")
lines(datetime, subMeter3, type = "l", col = "blue")
legend("topright", c("Sub Meter 1", "Sub Meter 2", "Sub Meter 3"), lty = 1,   col = c("black", "red", "blue"))
dev.off()

