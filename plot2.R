header <- read.table("household_power_consumption.txt",sep=";",header=F,nrows = 1)

data <- read.table("household_power_consumption.txt",sep=";",header=F,skip=66637,nrows = 2880,col.names = as.character(unlist(header[1,])))

data$Date_Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

plot(data$Date_Time,data$Global_active_power,type='l',ylab="Global Active Power (kilowats)",xlab="")

dev.copy(png,file="plot2.png",width=480,height=480)

dev.off()