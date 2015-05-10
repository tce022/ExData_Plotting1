#Read data from file, assuming file is in current directory
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

#Filter data for required days
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#Combine date and time col and convert it into objects
dateTime <- paste(data$Date, data$Time, sep=' ')
dateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
data <- cbind(data, dateTime)

#open PNG device
png(filename = "plot4.png", width = 480, height = 480)

#plot required data

with(data, {
  #set plot dimensions
  par(mfrow = c(2,2))
  #plot1
  plot(dateTime, Global_active_power, type="l", 
       xlab = "", ylab="Global Active Power")
  #plot2
  plot(dateTime, Voltage, type="l", ylab="Voltage")
  #plot3
  plot(dateTime, Sub_metering_1, type="l", xlab="", 
       ylab="Energy sub metering", col="black")  
  lines(dateTime, Sub_metering_2, type="l", col="red")  
  lines(dateTime, Sub_metering_3, type="l", col="blue")  
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lwd="1", col=c("black", "red", "blue"))
  #plot4
  plot(dateTime, Global_reactive_power, type="l")
})

dev.off() #close PNG device