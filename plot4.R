data <- read.table(file.choose(),header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),na = "?")
dim(data) # 2075259 9

## We only need data of 2 days.
newData<- subset(data,data$Date == "1/2/2007" | data$Date == "2/2/2007")

x <- paste(newData$Date, newData$Time)

newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) <- 1:nrow(newData)
dim(newData) # 2880   10

## Creating the plot
png(filename="plot4.png", width=480, height=480)

# Setting the canvas for 4 plots
par(mfcol=c(2,2))

# First plot
plot(newData$DateTime, newData$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

# Second plot
plot(newData$DateTime, newData$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(newData$DateTime, newData$Sub_metering_2, col="red")
lines(newData$DateTime, newData$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")

# Third Plot
plot(newData$DateTime, newData$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Fourth plot
plot(newData$DateTime, newData$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()
