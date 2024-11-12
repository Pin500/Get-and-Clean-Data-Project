# Load necessary libraries
library(dplyr)

# Step 1: Merging the training and the test sets to create one data set
# Read the data
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Load training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# Load test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

# Merge training and test sets
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged_data <- cbind(subject, Y, X)

# Step 2: Extract only the measurements on the mean and standard deviation for each measurement
mean_std_indices <- grep("mean\\(\\)|std\\(\\)", features$feature)
selected_data <- merged_data[, c(1, 2, mean_std_indices + 2)]


# Step 3: Use descriptive activity names to name the activities in the data set
selected_data$code <- activities[selected_data$code, 2]

# Step 4: Appropriately label the data set with descriptive variable names
names(selected_data)[2] <- "activity"
names(selected_data) <- gsub("^t", "Time", names(selected_data))
names(selected_data) <- gsub("^f", "Frequency", names(selected_data))
names(selected_data) <- gsub("Acc", "Accelerometer", names(selected_data))
names(selected_data) <- gsub("Gyro", "Gyroscope", names(selected_data))
names(selected_data) <- gsub("Mag", "Magnitude", names(selected_data))
names(selected_data) <- gsub("BodyBody", "Body", names(selected_data))

# Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data <- selected_data %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean = ~ mean(.)))

# Write the tidy data set to a file
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)
