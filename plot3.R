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

## Create the third graph
png('plot3.png')
with(playdate, plot(datetime, Sub_Metering_1, pch="", xlab="", ylab="Energy sub metering"))

with(playdate, lines(datetime, Sub_Metering_1))
with(playdate, lines(datetime, Sub_Metering_2, col="red"))
with(playdate, lines(datetime, Sub_Metering_3, col="blue"))

legend("topright",  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()