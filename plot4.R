#change to local directory
f <- 'C:/Users/Christel/Desktop/ExData_Plotting1-master/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt'

#load the data (all of it!)
td<-read.table(f, header = TRUE, sep = ";", colClasses = c("character","character", rep("numeric",7)), na.strings = "?")

fd<-subset(td,td$Date=="1/2/2007" | td$Date == "2/2/2007")

fd$Date <- as.Date(fd$Date, format = "%d/%m/%Y")
fd$DateTime <- as.POSIXct(paste(fd$Date, fd$Time))
Sys.setlocale("LC_TIME", "English")

#create plot4:

png("plot4.png")
par(mfrow = c(2, 2))
#same as plot 2
with(fd, plot(DateTime, Global_active_power, type="line", xlab="", ylab="Global Active Power (kilowatts)"))
# same lineplot but with different parameter
with(fd, plot(DateTime, Voltage, type="line", xlab="datetime", ylab="Voltage"))
#same as plot 3
with(fd, plot(DateTime, Sub_metering_1, "n", xlab="", ylab = "Energy sub metering"))
with(fd, points(DateTime, Sub_metering_1, type = "line"))
with(fd, points(DateTime, Sub_metering_2, type = "line", col = "red"))
with(fd, points(DateTime, Sub_metering_3, type = "line", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))
# lineplot similar to plot 2 with global reactive power
with(fd, plot(DateTime, Global_reactive_power, type="line", xlab="datetime"))
dev.off()
