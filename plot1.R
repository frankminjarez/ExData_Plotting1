## Set working directory to git project
setwd("~/ExData_Plotting1")


zipfile <- "household_power_consumption.zip"
destfile <- "household_power_consumption.txt"
if (!file.exists(destfile)) { 
        unzip(zipfile) 
}

dataset <- read.table(destfile, sep=";", header=T)

dataset$Date <- as.Date(as.character(dataset$Date), "%d/%m/%Y")

s <- subset(dataset, Date >= as.Date("2007-02-01"))
s <- subset(s, Date <= as.Date("2007-02-02"))

s$Global_active_power <- as.numeric(as.character(s$Global_active_power))

png("plot1.png",width=480,height=480)
hist(s$Global_active_power, xlab ="Global Active Power (kilowatts)", col="red", 
     main="Global Active Power", ylim=c(0,1200))
dev.off()
