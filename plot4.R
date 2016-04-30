setwd("C:/Nadine Hamilton/Coursera/Data Science Toolkit/datasciencecoursera/Exploratory data analysis")

df_file <- read.csv2("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)

# Capture subset of the data
df_subset <- df_file[df_file$Date == "1/2/2007" | df_file$Date == "2/2/2007",]

# create a new column concatenating date and time and append to df_subset
df_subset$FullDate <- apply(df_subset[,1:2], 1, paste, collapse = " ")
df_subset$FullDate = strptime(df_subset$FullDate, format = "%d/%m/%Y %H:%M:%S")

df_subset$Global_active_power = as.numeric(df_subset$Global_active_power)
df_subset$Voltage = as.numeric(df_subset$Voltage)
df_subset$Global_reactive_power = as.numeric(df_subset$Global_reactive_power)

png(file = "plot4.png")

#Plot 1
par(mfrow = c(2,2))

plot(df_subset$FullDate, df_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#Plot 2
plot(df_subset$FullDate, df_subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Plot 3
plot( df_subset$FullDate, df_subset$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
lines(df_subset$FullDate, df_subset$Sub_metering_2, col="red")
lines(df_subset$FullDate, df_subset$Sub_metering_3, col = "blue")
legend( "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col=c("black", "red", "blue"), bty = "n")

#Plot 4
plot(df_subset$FullDate, df_subset$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()