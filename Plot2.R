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
data$datetime <- as.POSIXct(datetime)

# plot 2
plot(hpc_subset$Global_active_power~hpc_subset$datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")


# save the chart
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


