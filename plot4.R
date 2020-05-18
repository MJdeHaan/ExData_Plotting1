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


# Convert the submetering variables to numbers
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

# Fix the formats of the voltage and reactive power
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

par(mfrow=c(2,2))  # num of cols and rows

# Plot 1 
plot(data$Date, data$Global_active_power,
     xlab="Day",
     ylab="Global Active Power (kilowatts)",
     type="l")

# plot 2

plot(data$Date, data$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")

# Plot 3
plot(data$Date, data$Sub_metering_1,
     xlab="Day",
     ylab="Energy sub metering",
     type="l")
lines(data$Date, data$Sub_metering_2, type="l",
      col="red")
lines(data$Date, data$Sub_metering_3, type="l",
      col="blue")

legend(c("topright"), c("Sub_metering_1", "Sub_metering_2",
                        "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty=1, bty="n")


#plot 4
plot(data$Date, data$Global_reactive_power,
     type="l",
     ylab="Global_reactive_power",
     xlabe="datetime")

dev.copy(png, "plot4.png")
dev.off()