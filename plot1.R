# set working directory
setwd("~/")

#initialize library
library("lubridate")

# load data into a data frame
household <- read.table("~/household_power_consumption.txt", header = TRUE,sep = ";")

# limit our scope only for 2 days
household_2days <- subset(household,dmy(household$Date) %in% c(dmy("01/02/2007"),dmy("02/02/2007")))

# push the plot to png file
png(filename="~/Exploratory_Data_Analysis_Week1/figure/plot1.png",width = 480, height = 480, units = "px")

#histogram of the data set
hist(as.numeric(as.character(household_2days$Global_active_power)), main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col = "red")

#disabling for the plot to be pushed to png file
dev.off()
