result <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
result$Date <- as.Date(result$Date, format = "%d/%m/%Y")
result2 <- result[result$Date >="2007-02-01" & result$Date <= "2007-02-02",]
result2$Date <- paste(result2$Date, result2$Time, sep = " ") 
result2 <- subset(result2, select = - Time)
colnames(result2)[1] <- "Date_Time"
result2$Sub_metering_1 <- as.numeric(result2$Sub_metering_1)
result2$Sub_metering_2 <- as.numeric(result2$Sub_metering_2)
result2$Sub_metering_3 <- as.numeric(result2$Sub_metering_3)
result2$Date_Time <- as.POSIXct(result2$Date_Time, format = "%Y-%m-%d %H:%M:%S")
plot(result2$Date_Time, result2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(result2$Date_Time, result2$Sub_metering_2, type = "l", col = "red")
lines(result2$Date_Time, result2$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), lwd = c(2.5, 2.5, 2.5), col = c("black", "red", "blue"), cex = 0.75)
dev.copy(png, 'plot3.png')
dev.off()
