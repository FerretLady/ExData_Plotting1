#change to local directory
f <- 'C:/Users/Christel/Desktop/ExData_Plotting1-master/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt'

#load the data (all of it!)
td<-read.table(f, header = TRUE, sep = ";", colClasses = c("character","character", rep("numeric",7)), na.strings = "?")

fd<-subset(td,td$Date=="1/2/2007" | td$Date == "2/2/2007")

fd$Date <- as.Date(fd$Date, format = "%d/%m/%Y")
fd$DateTime <- as.POSIXct(paste(fd$Date, fd$Time))
Sys.setlocale("LC_TIME", "English")


png("plot2.png")
par(mfrow = c(1, 1)) #reset mfrows incase you ran plot 4 first
#create plot2: linechart with 'day' and 'Global active power'
plot(fd$DateTime, fd$Global_active_power, type="line", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

