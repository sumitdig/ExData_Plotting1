# Load the data from the file
data <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

# Subset the data for only the two dates we are interested in
datasub <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Add a new column with Date & Tme values combined
datasub$dateTime <- strptime(paste(datasub$Date, datasub$Time), "%d/%m/%Y %H:%M")

# Create a png device for the plot
png("plot2.png", width=480, height=480)

# Plot the Graph
with(datasub, plot(dateTime, Global_active_power, type = "l", xlab="", ylab="Global Active Power(kilowatts)"))

# Close the device
dev.off()
