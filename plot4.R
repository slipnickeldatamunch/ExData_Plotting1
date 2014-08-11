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

## Create the fourth graph
png('plot4.png')
par(mar=c(5,4,2,2), mfrow=c(2,2))
with(playdate, plot(datetime, Global_Active_Power, pch="", xlab="", ylab="Global Active Power"))
with(playdate, lines(datetime, Global_Active_Power))
with(playdate, plot(datetime, Voltage, pch="", ylab="Voltage"))
with(playdate, lines(datetime, Voltage))
with(playdate, plot(datetime, Sub_Metering_1, pch="", xlab="", ylab="Energy sub metering"))
with(playdate, lines(datetime, Sub_Metering_1))
with(playdate, lines(datetime, Sub_Metering_2, col="red"))
with(playdate, lines(datetime, Sub_Metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red", "blue"), bty="n", cex=0.8)
with(playdate, plot(datetime, Global_Reactive_Power, pch="", ylab="Global_reactive_power", type="n"))
with(playdate, lines(datetime, Global_Reactive_Power))
dev.off()