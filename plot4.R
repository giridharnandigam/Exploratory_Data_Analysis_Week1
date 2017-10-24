setwd("~/")

library("lubridate")

household <- read.table("~/household_power_consumption.txt", header = TRUE,sep = ";")

household_2days <- subset(household,dmy(household$Date) %in% c(dmy("01/02/2007"),dmy("02/02/2007")))

combinedatetime <- strptime(paste(household_2days$Date, household_2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

gap <- as.numeric(as.numeric(as.character(household_2days$Global_active_power)))

voltage <- as.numeric(as.numeric(as.character(household_2days$Voltage)))

grp <- as.numeric(as.numeric(as.character(household_2days$Global_reactive_power)))

png("~/Exploratory_Data_Analysis_Week1/figure/plot4.png", width=480, height=480)


par(mfrow=c(2,2),mar=c(4, 4.5, 1, 0))

plot(combinedatetime, gap, type="l", col="black", xlab="", ylab="Global Active Power")

plot(combinedatetime, voltage, type="l", col="black", xlab="datetime", ylab="Voltage")

plot(combinedatetime, household_2days$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")

lines(combinedatetime, household_2days$Sub_metering_2, type="l", col="red")

lines(combinedatetime, household_2days$Sub_metering_3, type="l", col="blue")


legend('topright',legend =  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("dark grey","red","blue")
       , bty='o', cex=0.4,lty = 1:1)

plot(combinedatetime, grp, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")

dev.off()

