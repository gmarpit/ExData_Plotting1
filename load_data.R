data <- read.table(file.choose(),header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),na = "?")
dim(data) # 2075259 9

## We only need data of 2 days.
newData<- subset(data,data$Date == "1/2/2007" | data$Date == "2/2/2007")

x <- paste(newData$Date, newData$Time)

newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) <- 1:nrow(newData)
dim(newData) # 2880   10
