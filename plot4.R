header <- read.table("household_power_consumption.txt",sep=";",header=F,nrows = 1)

data <- read.table("household_power_consumption.txt",sep=";",header=F,skip=66637,nrows = 2880,col.names = as.character(unlist(header[1,])))

data$Date_Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

par(mfcol = c(2,2))


plot(data$Date_Time,data$Global_active_power,type='l',ylab="Global Active Power",xlab="")

plot(data$Date_Time,data$Sub_metering_1,type='l',col="black",ylab="Energy sub metering",xlab="")

points(data$Date_Time,data$Sub_metering_2,type='l',col="red")

points(data$Date_Time,data$Sub_metering_3,type='l',col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,y.intersp = 0.2,cex=0.5)

plot(data$Date_Time,data$Voltage,type='l',ylab="Voltage",xlab="datetime")

plot(data$Date_Time,data$Global_reactive_power,type='l',ylab = "Global_reactive_power",xlab="datetime")

dev.copy(png,file="plot4.png",width=480,height=480)

dev.off()