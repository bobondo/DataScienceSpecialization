# Author: Barry Obondo
# Data Science Specialization: Johns Hopkins University on Coursera
# Exploratory Data Analysis
# Project 1
###############################################################

# Set WD

# setwd("C:/Users/jabondo/desktop/Dropbox/Coursera_DSS/4_ExpDA/project1")
setwd("C:/Users/barry_000/Desktop/Dropbox/Coursera_DSS/4_ExpDA/project1")
# setwd("C:/data/Dropbox/Coursera_DSS/4_ExpDA/project1")

filename <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"

# download dataset file if does not exist
if(!file.exists(filename)){
  datasetURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(datasetURL, destfile="exdata%2Fdata%2Fhousehold_power_consumption.zip")}
# unzip dataset if not yet unzipped
if (!file.exists("household_power_consumption.txt")) {
  unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")}



# read data
consumption <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors=FALSE, dec=".", na="?", colClasses = c("character", "character", rep("numeric",7)))

# subset data to required time period
subdata <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]
str(subdata)  # check variable types

subdata$Datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
str(subdata)  # confirm variable types


# PLOT 1: 
hist(subdata$Global_active_power, main="Global Active Power",  
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=550, width=550)
dev.off()

## PLOT 2
plot(subdata$Datetime, subdata$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=550, width=550)
dev.off()

## PLOT 3
plot(subdata$Datetime, subdata$Sub_metering_1, type="l", ylab="Energy submetering", xlab="")
lines(subdata$Datetime, subdata$Sub_metering_2, col="red")
lines(subdata$Datetime, subdata$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=550, width=550)
dev.off()


## PLOT 4

# define graph space as 2 by 2
par(mfrow=c(2,2))

# graph 1 of 4
plot(subdata$Datetime, subdata$Global_active_power, type="l", ylab="Global Active Power", xlab="")
# graph 2 of 4
plot(subdata$Datetime, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
# graph 3 of 4
plot(subdata$Datetime, subdata$Sub_metering_1, type="l", ylab="Energy submetering", xlab="")
lines(subdata$Datetime, subdata$Sub_metering_2, col="red")
lines(subdata$Datetime, subdata$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,  bty="n", cex=0.75 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# plot 4 of 4
plot(subdata$Datetime, subdata$Global_reactive_power, 
     type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", height=1000, width=1000)
dev.off()



