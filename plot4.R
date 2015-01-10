#read data
setwd("E:/_Dropbox(ed3136)/Dropbox/Coursera/exploratory data")
data<- read.table("household_power_consumption.txt", sep=";", 
                  ,nrows=70000, header=TRUE, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
days <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")
#date+time
date_time <- paste(days$Date,days$Time)
datetime <-strptime(date_time, format="%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

#plot4 to png
png(filename="plot4.png")
par(mfcol=c(2,2))
#4-1
plot(datetime,days$Global_active_power, type="n",
     xlab="", ylab="Global Active Power (kilowatts)" )
lines(datetime,days$Global_active_power)
#4-2
plot(datetime,days$Sub_metering_1, type="n",
     xlab="", ylab="Energy sub metering" )
lines(datetime, days$Sub_metering_1)
lines(datetime, days$Sub_metering_2,col="red")
lines(datetime, days$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n",lty=1,lwd=1,col=c("black","red","blue"))
#4-3
plot(datetime,days$Voltage,type="n", ylab="Voltage")
lines(datetime,days$Voltage)
#4-4
plot(datetime,days$Global_reactive_power, type="n",
     ylab="Global_reactive_power" )
lines(datetime,days$Global_reactive_power)

dev.off()
