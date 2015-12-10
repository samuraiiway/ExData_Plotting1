library(sqldf)

#Read data from file by using sql select to filter data only date is Feb 1, 2007 to Feb 2, 2007
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")

#Close connection for loading data file
closeAllConnections()

#Transform Column Date to Date variable
data <- transform(data, DateTime = strptime(paste(Date, Time), format("%d/%m/%Y %H:%M:%S")))

#Select PNG device to plot with size 480 x 480
png("plot4.png", width = 480, height = 480)

#Set margin for plot
par(mar = c(5,5,4,2))

#Create multiple plot 2x2 in one canvas
par(mfcol = c(2,2))

#Create first plot at topleft
plot(data$DateTime, data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

#Create second plot at bottomleft
plot(data2$DateTime, data2$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data2$DateTime, data2$Sub_metering_1)
lines(data2$DateTime, data2$Sub_metering_2, col = "red")
lines(data2$DateTime, data2$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Create third plot at topright
plot(data$DateTime, data$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(data$DateTime, data$Voltage)

#Create last plot at bottomright
plot(data$DateTime, data$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global Reactive Power (kilowatts)")
lines(data$DateTime, data$Global_reactive_power)


#close graphical device
dev.off()