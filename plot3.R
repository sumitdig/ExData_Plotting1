# Load the data from the file
data <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

# Subset the data for only the two dates we are interested in
datasub <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Add a new column with Date & Tme values combined
datasub$dateTime <- strptime(paste(datasub$Date, datasub$Time), "%d/%m/%Y %H:%M")

# Create a png device for the plot
png("plot3.png", width=480, height=480)

# Plot the Graph
with(datasub, plot(dateTime, Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering", col="black"))
with(datasub, points(dateTime, Sub_metering_2, type = "l", col="red"))
with(datasub, points(dateTime, Sub_metering_3, type = "l", col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

# Close the device
dev.off()
