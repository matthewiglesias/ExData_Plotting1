## Matthew Iglesias
## 09Aug2015
## Plot2.R

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
png(filename='plot2.png', width = 480, height = 480, units = 'px')

#plot data
plot(dat$newdate, as.numeric(dat$Global_active_power), ylab='Global Active Power (kilowatts)' , xlab='',type = 'l')

#close device
x <- dev.off()

