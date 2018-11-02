result <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
result$Date <- as.Date(result$Date, format = "%d/%m/%Y")
result2 <- result[result$Date >="2007-02-01" & result$Date <= "2007-02-02",]
result2$Date <- paste(result2$Date, result2$Time, sep = " ") 
result2 <- subset(result2, select = - Time)
colnames(result2)[1] <- "Date_Time"
result2$Global_active_power <- as.numeric(result2$Global_active_power)
result2$Date_Time <- as.POSIXct(result2$Date_Time, format = "%Y-%m-%d %H:%M:%S")
plot(result2$Date_Time, result2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, 'plot2.png')
dev.off()
