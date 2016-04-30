setwd("C:/Nadine Hamilton/Coursera/Data Science Toolkit/datasciencecoursera/Exploratory data analysis")

df_file <- read.csv2("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)

# Capture subset of the data
df_subset <- df_file[df_file$Date == "1/2/2007" | df_file$Date == "2/2/2007",]

# create a new column concatenating date and time and append to df_subset
df_subset$FullDate <- apply(df_subset[,1:2], 1, paste, collapse = " ")
df_subset$FullDate = strptime(df_subset$FullDate, format = "%d/%m/%Y %H:%M:%S")

# convert to numeric
df_subset$Sub_metering_1 = as.numeric(df_subset$Sub_metering_1)
df_subset$Sub_metering_2 = as.numeric(df_subset$Sub_metering_2)
df_subset$Sub_metering_3 = as.numeric(df_subset$Sub_metering_3)

# Open graphic device
png(file = "plot3.png")
plot( df_subset$FullDate, df_subset$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
lines(df_subset$FullDate, df_subset$Sub_metering_2, col="red")
lines(df_subset$FullDate, df_subset$Sub_metering_3, col = "blue")
legend( "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col=c("black", "red", "blue"))
#Close graphic device
dev.off()