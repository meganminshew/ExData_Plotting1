## read the data from the working folder
dt <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", colClasses="character")
## class the date
dt$Date = as.Date(dt$Date, format = '%d/%m/%Y')
## filter for the 2 days
dt <- subset(dt, dt$Date == "2007-02-01" | dt$Date == "2007-02-02")
## paste date and time together and make it date/time
dt$Time <- strptime(paste(dt$Date, dt$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

##output the 2x2 plots to PNG
png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(dt$Time, dt$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(dt$Time, dt$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(dt$Time, dt$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(dt$Time, dt$Sub_metering_2, type="l", col="red")
lines(dt$Time, dt$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, bty="n", col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
plot(dt$Time, dt$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()
