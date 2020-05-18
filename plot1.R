data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# convert the date to charcter first
data$Date <- as.character(data$Date)

# Create the subset
data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007", ]

# Change the global active power to w in numbers
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

par(mfrow=c(1,1))
hist(data$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

dev.copy(png, "plot1.png")
dev.off()