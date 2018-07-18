###################################################
# R Command used to create histogram plot
###################################################

# Read/Load data

FName <- "household_power_consumption.txt"
CompleteData <- read.table(FName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
CompleteData$Date <- as.Date(Complete$Date, format = "%d/%m/%Y")

# subset data

SubData <- CompleteData[CompleteData$Date %in% c("1/2/2007","2/2/2007") ,]

# convert to numeric needed field/column

globalActivePower <- as.numeric(SubData$Global_active_power)

# creation of histogram to decvice

png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off() 