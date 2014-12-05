header <- read.table("household_power_consumption.txt",sep=";",header=F,nrows = 1)

data <- read.table("household_power_consumption.txt",sep=";",header=F,skip=66637,nrows = 2880,col.names = as.character(unlist(header[1,])))

data$Date_Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

plot(data$Date_Time,data$Sub_metering_1,type='l',col="black",ylab="Energy sub metering",xlab="")

points(data$Date_Time,data$Sub_metering_2,type='l',col="red")

points(data$Date_Time,data$Sub_metering_3,type='l',col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,y.intersp = 0.5,cex=0.7)

dev.copy(png,file="plot3.png",width=480,height=480)

dev.off()