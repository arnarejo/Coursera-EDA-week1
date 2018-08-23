# set working directory
# setwd("~/Documents/programming/coursera/DS/assignments/EDA/week1")

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

# Plot 1 - Frequency histogram of global active power consumption
png("plot1.png", width=480, height=480)
hist(data$globalActivePower, 
     col="red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()