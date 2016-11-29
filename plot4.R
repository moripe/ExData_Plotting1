

setwd("~/coursera/4. exploratory analysis/week1/exdata%2Fdata%2Fhousehold_power_consumption")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
date_time <- strptime(paste(subSet_data$Date, subSet_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_Active_Power <- as.numeric(subSet_data$Global_active_power)
global_Reactive_Power <- as.numeric(subSet_data$Global_reactive_power)
voltage <- as.numeric(subSet_data$Voltage)
subMetering1 <- as.numeric(subSet_data$Sub_metering_1)
subMetering2 <- as.numeric(subSet_data$Sub_metering_2)
subMetering3 <- as.numeric(subSet_data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(date_time, global_Active_Power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time, global_Reactive_Power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
