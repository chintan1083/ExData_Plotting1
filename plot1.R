header <- read.table("household_power_consumption.txt",sep=";",header=F,nrows = 1)

data <- read.table("household_power_consumption.txt",sep=";",header=F,skip=66637,nrows = 2880,col.names = as.character(unlist(header[1,])))

hist(data$Global_active_power,col='red',main="Global Active Power",xlab="Global Active Power (kilowats)")

dev.copy(png,file="plot1.png",width=480,height=480)

dev.off()

