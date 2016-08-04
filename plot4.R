##retrieve data part
hpc <- read.table("household_power_consumption.txt", header=TRUE,sep = ";")

hpc <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007", ]

hpc$Time <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date,format = "%d/%m/%Y")

hpc[,3:9] <- lapply(hpc[,3:9],as.character)
hpc[,3:9] <- lapply(hpc[,3:9],as.numeric)

##plot part
png(file = "plot4.png")

par(mfcol = c(2,2))
plot(hpc$Time,hpc$Global_active_power,type="n",xlab = "",ylab = "Global Active Power")
lines(hpc$Time,hpc$Global_active_power,type="l")

plot(hpc$Time,hpc$Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering")
lines(hpc$Time,hpc$Sub_metering_1,type="l",col = "black")
lines(hpc$Time,hpc$Sub_metering_2,type="l",col = "red")
lines(hpc$Time,hpc$Sub_metering_3,type="l",col = "blue")
legend("topright",pch = 151,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")

plot(hpc$Time,hpc$Voltage,type = "n",xlab = "datetime", ylab = "Voltage")
lines(hpc$Time,hpc$Voltage,type="l")

plot(hpc$Time,hpc$Global_reactive_power,type = "n",xlab = "datetime")
lines(hpc$Time,hpc$Global_reactive_power,type="l")

dev.off()