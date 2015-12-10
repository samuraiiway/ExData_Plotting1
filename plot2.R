library(sqldf)

#Read data from file by using sql select to filter data only date is Feb 1, 2007 to Feb 2, 2007
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")

#Close connection for loading data file
closeAllConnections()

#Transform Column Date to Date variable
data <- transform(data, DateTime = strptime(paste(Date, Time), format("%d/%m/%Y %H:%M:%S")))

#Select PNG device to plot with size 480 x 480
png("plot2.png", width = 480, height = 480)

#Set margin for plot
par(mar = c(5,5,4,2))

#Create line chart
plot(data$DateTime, data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

#close graphical device
dev.off()