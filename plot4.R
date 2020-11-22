complete_data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE)

my_data <- subset(complete_data, Date %in% c("1/2/2007","2/2/2007"))

my_data$Datetime <-as.POSIXlt.character(paste(my_data$Date,my_data$Time),format = "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

plot(x=my_data$Datetime ,y=my_data$Global_active_power, type = 'l', xlab='',ylab = 'Global Active Pow er')
plot(x=my_data$Datetime ,y=my_data$Voltage, type = 'l', xlab='datetime',ylab = 'Voltage')
plot(x=my_data$Datetime,y=my_data$Sub_metering_1, type='l', col = 'black', ylab = 'Energy sub metering', xlab = '')
lines(x=my_data$Datetime,y=my_data$Sub_metering_2, col='red')
lines(x=my_data$Datetime,y=my_data$Sub_metering_3, col='blue')
legend('topright', legend = c('Sub_metering_1',"Sub_metering_2","Sub_metering_3"), col = c('black','red','blue'), lty = 1, bty = "n")
plot(x=my_data$Datetime ,y=my_data$Global_reactive_power, type = 'l', xlab='datetime',ylab = 'Global_reactive_power')

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()