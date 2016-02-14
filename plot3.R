file<-"household_power_consumption.txt"
data<-read.table(file, header=TRUE, sep=";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
subdata<-subset(data, Date == "2007-2-1"|Date=="2007-2-2" )

DT<-as.POSIXct(paste(subdata$Date,subdata$Time))
GAP<-as.numeric(subdata$Global_active_power)
M1<-as.numeric(subdata$Sub_metering_1)
M2<-as.numeric(subdata$Sub_metering_2)
M3<-as.numeric(subdata$Sub_metering_3)

png("plot3.png",width = 480, height = 480)
plot(DT,M1,type="l",ylab="Energy Submetering",xlab="")
lines(DT,M2,type="l",col="red")
lines(DT, M3, type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd = 2.5, col=c("black","red","blue"))
dev.off()
