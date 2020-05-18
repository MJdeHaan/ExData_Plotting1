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

par(mfrow=c(1,1))
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
       lty=1)

dev.copy(png, "plot3.png")
dev.off()