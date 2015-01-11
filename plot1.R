# Reading the File
data <- read.table(file.choose(),header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),na = "?")

## We only need data of 2 days.
newData<- subset(data,data$Date == "1/2/2007" | data$Date == "2/2/2007")
x <- paste(newData$Date, newData$Time)
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) <- 1:nrow(newData)

# Creating the plot
png(filename="plot1.png", width=480, height=480)
hist(newData$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")
dev.off()
