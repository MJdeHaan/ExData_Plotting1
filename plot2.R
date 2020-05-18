data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# convert the date to charcter first
data$Date <- as.character(data$Date)


# Create the subset
data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007", ]

# Change the global active power to w in numbers
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# Concatenate the date and time together
data$Time <- as.character(data$Time)
data$Date <- strptime(paste(data$Date, data$Time), 
                      format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1))
plot(data$Date, data$Global_active_power,
     xlab="Day",
     ylab="Global Active Power (kilowatts)",
     type="l")


dev.copy(png, "plot2.png")
dev.off()