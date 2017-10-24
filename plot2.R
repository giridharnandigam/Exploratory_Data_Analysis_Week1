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

#get Global Active Power data
gap <- as.numeric(as.numeric(as.character(household_2days$Global_active_power)))

# push the plot to png file
png("~/Exploratory_Data_Analysis_Week1/figure/plot2.png", width=480, height=480)

# now plot it
plot(combinedatetime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#disabling for the plot to be pushed to png file
dev.off()

