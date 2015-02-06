setwd("~/Classes/DSS/04_Explatory_Data_Analysis/ExData_Plotting1/")

# get data
hpc <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# convert date
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

# subset the data
hpc_subset <- subset(hpc, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

# fix datetime
datetime <- paste(as.Date(data$Date), data$Time)
hpc_subset$datetime <- as.POSIXct(datetime)

# plot 3
with(hpc_subset, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()


