#Read data from file, assuming file is in current directory
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

#Filter data for required days
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#Combine date and time col and convert it into objects
dateTime <- paste(data$Date, data$Time, sep=' ')
dateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")

#open PNG device
png(filename = "plot2.png", width = 480, height = 480)

#plot required data
plot(dateTime, data$Global_active_power, type="l", 
     xlab = "", ylab="Global Active Power (kilowatts)")

dev.off() #close PNG device