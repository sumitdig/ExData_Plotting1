# Set the working directory
setwd("~/Data_Science/Course4_Exploratory_Data_Analysis/Week1/Project")

# Unzip the file (after downloading it using the link provided)
unzip("exdata_data_household_power_consumption.zip")

# Load the data from the file
data <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

# Subset the data for only the two dates we are interested in
datasub <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Create a png device for the plot
png("plot1.png", width=480, height=480)

# Plot the Graph
with(datasub, hist(Global_active_power, xlab = "Global Active Power(kilowatts)", ylab="Frequency", main="Global Active Power", col="Red"))

# Close the device
dev.off()
