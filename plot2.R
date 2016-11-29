

setwd("~/coursera/4. exploratory analysis/week1/exdata%2Fdata%2Fhousehold_power_consumption")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
date_time <- strptime(paste(subSet_data$Date, subSet_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_Active_Power <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(date_time, global_Active_Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
