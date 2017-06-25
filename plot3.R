#change to local directory
f <- 'C:/Users/Christel/Desktop/ExData_Plotting1-master/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt'

#load the data (all of it!)
td<-read.table(f, header = TRUE, sep = ";", colClasses = c("character","character", rep("numeric",7)), na.strings = "?")

fd<-subset(td,td$Date=="1/2/2007" | td$Date == "2/2/2007")

fd$Date <- as.Date(fd$Date, format = "%d/%m/%Y")
fd$DateTime <- as.POSIXct(paste(fd$Date, fd$Time))
Sys.setlocale("LC_TIME", "English")

png("plot3.png")
par(mfrow = c(1, 1)) #reset mfrows incase you ran plot 4 first

#create plot3: linechart with 3 colors and legend (days vs energy submeltering)
plot(fd$DateTime, fd$Sub_metering_1, "n", xlab="", ylab = "Energy sub metering")
with(fd, points(DateTime, Sub_metering_1, type = "line"))
with(fd, points(DateTime, Sub_metering_2, type = "line", col = "red"))
with(fd, points(DateTime, Sub_metering_3, type = "line", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))
dev.off()