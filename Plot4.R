## Matthew Iglesias
## 09Aug2015
## Plot4.R

#read data
#assumes data is already in working directory, unziped.
dat <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#filter data only by needed dates
dat <- dat[dat$Date =='1/2/2007' | dat$Date == '2/2/2007',]

#format date column as date format
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

#create a new column from Date and Time column
dat$newdate <- with(dat, as.POSIXct(paste(dat$Date,dat$Time), format ="%Y-%m-%d %H:%M:%S"))

#open device
png(filename='plot4.png', width = 480, height = 480, units = 'px')

par(mfrow=c(2,2))

#plot data top left
plot(dat$newdate, as.numeric(dat$Global_active_power), ylab='Global Active Power (kilowatts)' , xlab='',type = 'l')

#plot data top right
plot(dat$newdate, as.numeric(dat$Voltage), ylab='Voltage', xlab='datetime' ,type = 'l')

#plot data
lncol <-c('black','red','blue')
lbls <- c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(dat$newdate,dat$Sub_metering_1,type = 'l', col=lncol[1],xlab = '',ylab = 'Energy sub metering')
lines(dat$newdate,dat$Sub_metering_2,col=lncol[2])
lines(dat$newdate,dat$Sub_metering_3,col=lncol[3])

#add legend
legend('topright',legend = lbls,col = lncol,lty = 'solid')

#plot data top right
plot(dat$newdate, as.numeric(dat$Global_reactive_power), ylab='Global_reactive_power', xlab='datetime' ,type = 'l')

#close device
x <- dev.off()

