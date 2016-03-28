## Get full dataset
data_full <- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?")

##Convert Date variable to Date format
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

##Subset the data to include only Februarly 1-2, 2007
data_subset <- subset(data_full, subset=(Date >="2007-02-01" & Date <= "2007-02-02"))

##Create Plot 1
hist(data_subset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png, file="ExData_Plotting1/plot1.png", width=480, height=480)
dev.off()