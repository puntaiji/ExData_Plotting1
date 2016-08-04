
##retrieve data part
hpc <- read.table("household_power_consumption.txt", header=TRUE,sep = ";")

hpc <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007", ]

hpc$Time <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date,format = "%d/%m/%Y")

hpc[,3:9] <- lapply(hpc[,3:9],as.character)
hpc[,3:9] <- lapply(hpc[,3:9],as.numeric)

##plot part
png(file = "plot1.png")

par(mfcol = c(1,1))
hist(hpc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col = "red")

dev.off()