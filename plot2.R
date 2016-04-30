setwd("C:/Nadine Hamilton/Coursera/Data Science Toolkit/datasciencecoursera/Exploratory data analysis")

df_file <- read.csv2("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)

# Capture subset of the data
df_subset <- df_file[df_file$Date == "1/2/2007" | df_file$Date == "2/2/2007",]

# convert to numeric
df_subset$Global_active_power = as.numeric(df_subset$Global_active_power)

# create a new column concatenating date and time and append to df_subset
df_subset$FullDate <- apply(df_subset[,1:2], 1, paste, collapse = " ")
df_subset$FullDate = strptime(df_subset$FullDate, format = "%d/%m/%Y %H:%M:%S")

# to remove the FullDate column
# df_subset$FullDate <- NULL

# plot
png(file = "plot2.png")
plot(df_subset$FullDate, df_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
#Close graphic device
dev.off()