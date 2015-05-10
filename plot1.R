#Read data from file, assuming file is in current directory
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

#Filter data for required days
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#open PNG device
png(filename = "plot1.png", width = 480, height = 480)
#Plot histogram
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power",
     col="RED")

dev.off() #close PNG device