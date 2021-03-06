# we load the data from the file
complete_data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE)

# we subset the data to keep only the data we want to use
my_data <- subset(complete_data, Date %in% c("1/2/2007","2/2/2007"))

#we format the date
my_data$Datetime <-as.POSIXlt.character(paste(my_data$Date,my_data$Time),format = "%d/%m/%Y %H:%M:%S")

#we create the histogram
hist(my_data$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', ylab="Frequency")

#we create the png file
dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()