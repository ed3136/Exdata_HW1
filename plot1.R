setwd("E:/_Dropbox(ed3136)/Dropbox/Coursera/exploratory data")
data<- read.table("household_power_consumption.txt", sep=";", 
                   ,nrows=70000, header=TRUE, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
days <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

#plot1  png
png(filename="plot1.png")
hist(days$Global_active_power, col="red",
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()