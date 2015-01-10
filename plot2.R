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

#plot2 to png file
png(filename="plot2.png")
plot(datetime,days$Global_active_power, type="n",
     xlab="", ylab="Global Active Power (kilowatts)" )
lines(datetime,days$Global_active_power)
dev.off()