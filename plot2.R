##retrieve data part
hpc <- read.table("household_power_consumption.txt", header=TRUE,sep = ";")

hpc <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007", ]

hpc$Time <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date,format = "%d/%m/%Y")

hpc[,3:9] <- lapply(hpc[,3:9],as.character)
hpc[,3:9] <- lapply(hpc[,3:9],as.numeric)

##plot part
png(file = "plot2.png")

par(mfcol = c(1,1))
plot(hpc$Time,hpc$Global_active_power,type="n",xlab = "",ylab = "Global Active Power (kilowatts)")
lines(hpc$Time,hpc$Global_active_power,type="l")

dev.off()