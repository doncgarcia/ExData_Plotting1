###################################################
# R Command used to create four (4) plots
###################################################

# Read/Load data

FName <- "household_power_consumption.txt"
CompleteData <- read.table(FName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
CompleteData$Date <- as.Date(Complete$Date, format = "%d/%m/%Y")

#sub set data

SubData <- CompleteData[CompleteData$Date %in% c("1/2/2007","2/2/2007") ,]

# creation of date and time variable

datetime <- strptime(paste(SubData$Date, SubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# converion of text data to numeric

globalActivePower <- as.numeric(SubData$Global_active_power)
subMetering1 <- as.numeric(SubData$Sub_metering_1)
subMetering2 <- as.numeric(SubData$Sub_metering_2)
subMetering3 <- as.numeric(SubData$Sub_metering_3)
voltage <- as.numeric(SubData$Voltage)
globalReactivePower <- as.numeric(SubData$Global_reactive_power)

# creation of plot to device

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()