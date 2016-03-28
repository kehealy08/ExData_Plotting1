## Get full dataset
data_full <- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=FALSE)

##Convert Date and time variables to Datetime
data_full$datetime <-strptime(paste(data_full$Date, data_full$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Subset the data to include only Februarly 1-2, 2007
data_subset <- subset(data_full, subset=(datetime >="2007-02-01 00:00:00" & datetime <= "2007-02-02 23:59:59"))

##Create Plot 4
png("ExData_Plotting1/plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data_subset$datetime, data_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", main="")
plot(data_subset$datetime, data_subset$Voltage, type="l", xlab="datetime", ylab="Voltage", main="")
plot(data_subset$datetime, data_subset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", main="", col="wheat4")
lines(data_subset$datetime, data_subset$Sub_metering_2, col="tomato2")
lines(data_subset$datetime, data_subset$Sub_metering_3, col="royalblue4")
legend("topright", col=c("wheat4 ", "tomato2", "royalblue4"),lty=1, lwd=2.5, bty="n",legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
plot(data_subset$datetime, data_subset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  
dev.off()
