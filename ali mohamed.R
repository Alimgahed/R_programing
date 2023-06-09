# Read the  file
ds <- read.csv("G3_sydney_hobart_times.csv", header = TRUE)
# Remove "day" from the Time column and convert it to numeric
ds$Time <- as.numeric(sub("day", "", ds$Time))
# get a mean of time to input the missing value 
mean_time <- mean(df$Time)
cat("Mean Time:", mean_time, "\n")
rows_to_update <- c(5, 9, 13, 19, 31, 46, 58)
ds[rows_to_update, "Time"] <- 6.959848
#make inputation to the column code.time,less.than.3
rows_to_update <- 1:72
ds[rows_to_update, "Code.Time.less.than.3"] <- ifelse(ds$Time < 3, "less than 3", "more than 3")
ds
# Check the structure of the dataframe
str(ds)
# Calculate the minimum and maximum time
min_time <- min(ds$Time)
max_time <- max(ds$Time)
cat("Minimum Time:", min_time, "\n")
cat("Maximum Time:", max_time, "\n")
library(ggplot2)
# Create the bar chart of code.time.less.than.3
ggplot(ds, aes(x = Year, fill = Code.Time.less.than.3)) +
  geom_bar() +
  labs(x = "Year", y = "Count", fill = "Code Time") +
  scale_fill_manual(values = c("more than 3" = "black", "less than 3" = "grey")) +
  theme_minimal()
# Create scatter plot of fleet start and fleet finish 
ggplot(ds) +
  geom_point(aes(x =Year, y = Time, color = Code.Time.less.than.3), size = 3) +
  labs(title = "Start Fleet vs Finish Fleet",
       x = "Fleet Start",
       y = "Fleet Finish") +
  theme_minimal()
# Create the histogram OF YEAR AND TIME
ggplot(data = ds, aes(x = Year, y = Time)) +
  geom_col(fill = "blue") +
  labs(x = "Year", y = "Time") +
  ggtitle("Histogram of Year vs. Time")
# Create a histogram of Time
hist(ds$Time, breaks = 20, xlab = "Time", ylab = "Frequency", main = "Distribution of Recorded Times")
