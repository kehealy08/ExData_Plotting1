## Get full dataset
data_full <- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=FALSE)

##Convert Date and time variables to Datetime
data_full$datetime <-strptime(paste(data_full$Date, data_full$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Subset the data to include only Februarly 1-2, 2007
data_subset <- subset(data_full, subset=(datetime >="2007-02-01 00:00:00" & datetime <= "2007-02-02 23:59:59"))

##Create Plot 2
plot(data_subset$datetime, data_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", main="")
dev.copy(png, file="ExData_Plotting1/plot2.png", width=480, height=480)
dev.off()