file<-"household_power_consumption.txt"
data<-read.table(file, header=TRUE, sep=";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
subdata<-subset(data, Date == "2007-2-1"|Date=="2007-2-2" )

GAP<-as.numeric(subdata$Global_active_power)
DT<-as.POSIXct(paste(subdata$Date,subdata$Time))
png("plot2.png",width = 480, height = 480)
plot(DT,GAP,type="l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()