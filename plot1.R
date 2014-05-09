## read the data from the working folder
dt <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", colClasses="character")
## class the date
dt$Date = as.Date(dt$Date, format = '%d/%m/%Y')
## filter for the 2 days
dt <- subset(dt, dt$Date == "2007-02-01" | dt$Date == "2007-02-02")
## get the attribute to plot and make it a number
gap <- as.numeric(dt$Global_active_power)

##output the histogram to PNG
png(filename="plot1.png", width=480, height=480, units="px", bg="transparent")
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()