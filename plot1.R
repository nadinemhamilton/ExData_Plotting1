
setwd("C:/Nadine Hamilton/Coursera/Data Science Toolkit/datasciencecoursera/Exploratory data analysis")

df_file <- read.csv2("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)

# Capture subset of the data
df_subset <- df_file[df_file$Date == "1/2/2007" | df_file$Date == "2/2/2007",]

# convert to numeric
df_subset$Global_active_power = as.numeric(df_subset$Global_active_power)

# Open graphic device
png(file = "plot1.png")
# Produce the histogram for Plot 1
hist(df_subset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
#Close graphic device
dev.off()