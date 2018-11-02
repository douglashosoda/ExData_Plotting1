result <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
result$Date <- as.Date(result$Date, format = "%d/%m/%Y")
result2 <- result[result$Date >="2007-02-01" & result$Date <= "2007-02-02",]
result2$Global_active_power <- as.numeric(as.character(result2$Global_active_power))
hist(result2$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, 'plot1.png')
dev.off()
