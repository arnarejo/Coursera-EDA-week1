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

# Plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2), mar=c(5.1,4.1,1.1,1.1), cex=0.7)

# plot (1,1)
plot(data$dateTime, data$globalActivePower, type="l",
     xlab = "",
     ylab="Global Active Power"
)

# plot (1,2)
plot(data$dateTime, data$Voltage, type="l",
     xlab = "datetime",
     ylab="Voltage"
)

# plot (2,1)
plot(data$dateTime, data$subMetering1, type="l", 
     xlab="",
     ylab="Energy sub metering"
)
lines(data$dateTime, data$subMetering2, col="red", type="l")
lines(data$dateTime, data$subMetering3, col="blue", type="l")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), 
       lty=1, cex=0.8)

# plot(2,2)
plot(data$dateTime, data$globalReactivePower, type="l",
     xlab = "datetime",
     ylab="Global_active_power"
     )

dev.off()