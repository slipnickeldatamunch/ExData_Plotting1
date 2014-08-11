## Bring in the data, limited to relevant values
playdate <- read.csv("household_power_consumption.txt", sep=";", skip = 66636, 
                  nrows=2880)
colnames(playdate) <- c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power",
                   "Voltage", "Global_Intensity", "Sub_Metering_1", "Sub_Metering_2",
                   "Sub_Metering_3")

##Create a field suitable for graphing the time series
playdate$Time <- strptime(playdate$Time, "%H:%M:%S")
playdate$datetime <- paste(playdate$Date, playdate$Time)
playdate$datetime <- strptime(playdate$datetime, "%d/%m/%Y %H:%M:%S")

## Create the first graph
png('plot1.png')
hist(playdate$Global_Active_Power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()

