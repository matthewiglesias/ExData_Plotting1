## Matthew Iglesias
## 09Aug2015
## Plot1.R

#read data
#assumes data is already in working directory, unziped.
dat <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#filter data only by needed dates
dat <- dat[dat$Date =='1/2/2007' | dat$Date == '2/2/2007',]

#open device
png(filename='plot1.png', width = 480, height = 480, units = 'px')

#plot data
hist(as.numeric(dat$Global_active_power), main='Global Active Power',xlab='Global Active Power (kilowatts)' ,col = "red")

#close device
x <- dev.off()
