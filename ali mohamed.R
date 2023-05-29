# Read the CSV file
df <- read.csv("G3_sydney_hobart_times.csv", header = TRUE)

# Remove "day" from the Time column and convert it to numeric
df$Time <- as.numeric(sub("day", "", df$Time))

# Set a single value for multiple rows at once
mean_time <- mean(df$Time)
cat("Mean Time:", mean_time, "\n")

rows_to_update <- c(5, 9, 13, 19, 31, 46, 58)
df[rows_to_update, "Time"] <- 6.959848

# Remove the Code.Time.less.than.3 column
df <- subset(df, select = -Code.Time.less.than.3)

# Check the structure of the dataframe
str(df)

# Calculate the minimum and maximum time
min_time <- min(df$Time)
max_time <- max(df$Time)
cat("Minimum Time:", min_time, "\n")
cat("Maximum Time:", max_time, "\n")

# Create a histogram of Time
hist(df$Time, breaks = 20, xlab = "Time", ylab = "Frequency", main = "Distribution of Recorded Times")
