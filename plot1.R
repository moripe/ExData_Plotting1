


setwd("~/coursera/4. exploratory analysis/week1/exdata%2Fdata%2Fhousehold_power_consumption")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
global_Active_Power <- as.numeric(subSet_data$Global_active_power)
png("plot1.png", width=500, height=500)
hist(global_Active_Power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
