library(sqldf)

#Read data from file by using sql select to filter data only date is Feb 1, 2007 to Feb 2, 2007
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")

#Close connection for loading data file
closeAllConnections()

#Select PNG device to plot with size 480 x 480
png("plot1.png", width = 480, height = 480)

#Set margin for plot
par(mar = c(5,5,4,2))

#Create Histogram graph
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

#close graphical device
dev.off()