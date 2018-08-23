# set working directory
setwd("~/Documents/PROGRAMMING/Coursera/DS/assignments/EDA/week1")

# file name
file <- "data/household_power_consumption.txt"

# read data
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# filter data for '1/2/2007' and '2/2/2007'
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# create a datetime column
data$dateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# modify data format of selective folders
data$globalActivePower <- as.numeric(data$Global_active_power)
data$globalReactivePower <- as.numeric(data$Global_reactive_power)
data$subMetering1 <- as.numeric(data$Sub_metering_1)
data$subMetering2 <- as.numeric(data$Sub_metering_2)
data$subMetering3 <- as.numeric(data$Sub_metering_3)

# Plot 2 - Line Graph of global active power over 2 days
png("plot2x.png", width=480, height=480)
plot(data$dateTime, data$globalActivePower, 
     type="l",
     xlab = "",
     ylab="Global Active Power (kilowatts)")
dev.off()