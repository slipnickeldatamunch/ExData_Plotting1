## Bring in the data, limited to relevant values
playdate <- read.csv("household_power_consumption.txt", sep=";", skip = 66636, 
                     nrows=2880)
colnames(playdate) <- c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power",
                        "Voltage", "Global_Intensity", "Sub_Metering_1", "Sub_Metering_2",
                        "Sub_Metering_3")

##Create a field suitable for graphing the time series
playdate$Date <- as.Date(playdate$Date, format="%d/%m/%Y")
playdate$datetime <- paste(playdate$Date, playdate$Time)
playdate$datetime <- strptime(playdate$datetime, "%Y-%m-%d %H:%M:%S")

##Create our second graph
par(mar=c(5,4,4,2))
png('plot2.png')
with(playdate, plot(datetime, Global_Active_Power, pch="", xlab="", ylab="Global Active Power (kilowatts)"))
with(playdate, lines(datetime, Global_Active_Power))
dev.off()
