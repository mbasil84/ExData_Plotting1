complete_data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE)

my_data <- subset(complete_data, Date %in% c("1/2/2007","2/2/2007"))

my_data$Datetime <-as.POSIXlt.character(paste(my_data$Date,my_data$Time),format = "%d/%m/%Y %H:%M:%S")

dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()