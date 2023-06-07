# Read the  file
ds <- read.csv("G3_sydney_hobart_times.csv", header = TRUE)
# Remove "day" from the Time column and convert it to numeric
ds$Time <- as.numeric(sub("day", "", ds$Time))

# get a mean of time to input the missing value 
mean_time <- mean(df$Time)
cat("Mean Time:", mean_time, "\n")

rows_to_update <- c(5, 9, 13, 19, 31, 46, 58)
ds[rows_to_update, "Time"] <- 6.959848

# Remove the Code.Time.less.than.3 column becuse all values is nall
ds <- subset(ds, select = -Code.Time.less.than.3)

# Check the structure of the dataframe
str(ds)

# Calculate the minimum and maximum time
min_time <- min(ds$Time)
max_time <- max(ds$Time)
cat("Minimum Time:", min_time, "\n")
cat("Maximum Time:", max_time, "\n")

# Create a histogram of Time
hist(ds$Time, breaks = 20, xlab = "Time", ylab = "Frequency", main = "Distribution of Recorded Times")
