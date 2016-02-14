file<-"household_power_consumption.txt"
data<-read.table(file, header=TRUE, sep=";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")
date<-data$Date
data$Date<-as.Date(date, format = "%d/%m/%Y")
subdata<-subset(data, Date == "2007-2-1"|Date=="2007-2-2" )

plot1<-as.numeric(subdata$Global_active_power)
png("plot1.png",width = 480, height = 480)
hist(plot1,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()