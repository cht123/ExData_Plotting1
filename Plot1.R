setwd("~/Classes/DSS/04_Explatory_Data_Analysis/ExData_Plotting1/")

# get data
hpc <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", 
                comment.char="", check.names = F, stringsAsFactors = F, quote="\"")

# convert date
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

# convert time to datetime
hpc$Time <- strptime(paste(hpc$Date,hpc$Time), format = "%Y-%m-%d %T")

# subset the data
hpc_subset <- subset(hpc, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

# Plot 1
hist(hpc_subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# save the chart
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

