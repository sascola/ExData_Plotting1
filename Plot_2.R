
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


# Generate the plot 2
png("plot2.png", width = 480, height = 480)
plot(datetime, globalActivePower, type = "l", main = "Global Active Power: 1-2 Feb 2007", xlab = "", ylab = "Global Active Power")
dev.off()
