## read the data from the working folder
dt <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", colClasses="character")
## class the date
dt$Date = as.Date(dt$Date, format = '%d/%m/%Y')
## filter for the 2 days
dt <- subset(dt, dt$Date == "2007-02-01" | dt$Date == "2007-02-02")
## paste date and time together and make it date/time
dt$Time <- strptime(paste(dt$Date, dt$Time, sep=" "), "%Y-%m-%d %H:%M:%S")



##output the plot to PNG
png(filename="plot2.png", width=480, height=480, units="px", bg="transparent")
plot(dt$Time, dt$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()