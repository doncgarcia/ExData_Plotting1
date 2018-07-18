###################################################
# R Command used to create plot/graph
###################################################

# Read/Load data

FName <- "household_power_consumption.txt"
CompleteData <- read.table(FName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
CompleteData$Date <- as.Date(Complete$Date, format = "%d/%m/%Y")

# Sub set needed data

SubData <- CompleteData[CompleteData$Date %in% c("1/2/2007","2/2/2007") ,]

# create data and time field/record

datetime <- strptime(paste(SubData$Date, SubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# conversion of text to numeric

globalActivePower <- as.numeric(SubData$Global_active_power)

# creation of graph to device 

png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

