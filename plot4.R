## Set working directory to git project
setwd("~/ExData_Plotting1")


zipfile <- "household_power_consumption.zip"
destfile <- "household_power_consumption.txt"
if (!file.exists(destfile)) { 
        unzip(zipfile) 
}

dataset <- read.table(destfile, sep=";", header=T, na.strings = "?")

dataset$Date <- as.Date(as.character(dataset$Date), "%d/%m/%Y")

s <- subset(dataset, Date >= as.Date("2007-02-01"))
s <- subset(s, Date <= as.Date("2007-02-02"))

s$DateTime <- as.POSIXct(paste(s$Date, s$Time), format="%Y-%m-%d %H:%M:%S")

s$Global_active_power <- as.numeric(as.character(s$Global_active_power))
s$Sub_metering_1 <- as.numeric(as.character(s$Sub_metering_1))
s$Sub_metering_2 <- as.numeric(as.character(s$Sub_metering_2))
s$Sub_metering_3 <- as.numeric(as.character(s$Sub_metering_3))
s$Voltage <- as.numeric(as.character(s$Voltage))
s$Global_reactive_power <- as.numeric(as.character(s$Global_reactive_power))

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(Global_active_power ~ DateTime, s, type="l", xlab="",
     ylab="Global Active Power")
plot(Voltage ~ DateTime, s, type="l",
     ylab="Voltage", xlab="datetime")
plot(Sub_metering_1 ~ DateTime, s, type="l", xlab="",
     ylab="Energy sub metering")
legend("topright", bty="n", lty=c(1,1,1), col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
lines(s$DateTime,s$Sub_metering_2,col="red")
lines(s$DateTime,s$Sub_metering_3,col="blue")
plot(Global_reactive_power ~ DateTime, s, type="l",
     ylab="Global_reactive_power", xlab="datetime")
dev.off()
