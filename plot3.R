# set working directory
setwd("~/")

#initialize library
library("lubridate")

# load data into a data frame
household <- read.table("~/household_power_consumption.txt", header = TRUE,sep = ";")

# limit our scope only for 2 days
household_2days <- subset(household,dmy(household$Date) %in% c(dmy("01/02/2007"),dmy("02/02/2007")))

#combine date n timestamp
combinedatetime <- strptime(paste(household_2days$Date, household_2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Get Sub metering data
gap <- as.numeric(as.numeric(as.character(household_2days$Sub_metering_1)))

#push the plot to png file
png("~/Exploratory_Data_Analysis_Week1/figure/plot3.png", width=480, height=480)

#set the margins
par(mar=c(5,5,3.0,3.0))

# plot it
plot(combinedatetime, household_2days$Sub_metering_1, type="l", col="dark grey", xlab="", ylab="Energy sub metering",
     ylim = c(0,35))

# addlines
lines(combinedatetime, household_2days$Sub_metering_2, type="l", col="red")

lines(combinedatetime, household_2days$Sub_metering_3, type="l", col="blue")

legend('topright',legend =  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("dark grey","red","blue")
       , bty='o', cex=0.75,lty = 1:1)

#disabling for the plot to be pushed to png file
dev.off()
