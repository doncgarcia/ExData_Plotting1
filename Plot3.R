###################################################
# R Command used to create line plot
###################################################

# Read/Load data

FName <- "household_power_consumption.txt"
CompleteData <- read.table(FName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
CompleteData$Date <- as.Date(Complete$Date, format = "%d/%m/%Y")

# sub set data
SubData <- CompleteData[CompleteData$Date %in% c("1/2/2007","2/2/2007") ,]

# create date & time variable

datetime <- strptime(paste(SubData$Date, SubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# conversion to numeric
globalActivePower <- as.numeric(SubData$Global_active_power)
subMetering1 <- as.numeric(SubData$Sub_metering_1)
subMetering2 <- as.numeric(SubData$Sub_metering_2)
subMetering3 <- as.numeric(SubData$Sub_metering_3)

# creation of graph to device

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
