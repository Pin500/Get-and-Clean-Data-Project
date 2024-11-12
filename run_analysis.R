
R version 4.4.1 (2024-06-14 ucrt) -- "Race for Your Life"
Copyright (C) 2024 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Previously saved workspace restored]

> # Load necessary libraries
> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

Warning message:
package ‘dplyr’ was built under R version 4.4.2 
> 
> # Download and unzip the dataset if it doesn't exist
> if (!file.exists("UCI HAR Dataset")) {
+   url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
+   download.file(url, destfile = "dataset.zip")
+   unzip("dataset.zip")
+ }
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
Content type 'application/zip' length 62556944 bytes (59.7 MB)
downloaded 59.7 MB

> 
> # Load the data
> features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
> activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
> subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
> x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
> y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
> subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
> x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
> y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
> 
> # Merge the training and the test sets
> subject <- rbind(subject_train, subject_test)
> X <- rbind(x_train, x_test)
> Y <- rbind(y_train, y_test)
> merged_data <- cbind(subject, Y, X)
> 
> # Extract only the measurements on the mean and standard deviation
> tidy_data <- merged_data %>%
+   select(subject, code, contains("mean"), contains("std"))
> 
> # Use descriptive activity names
> tidy_data$code <- activities[tidy_data$code, 2]
> 
> # Appropriately label the data set with descriptive variable names
> names(tidy_data)[2] <- "activity"
> names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
> names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
> names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))
> names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
> names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
> names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
> names(tidy_data) <- gsub("tBody", "TimeBody", names(tidy_data))
> names(tidy_data) <- gsub("-mean()", "Mean", names(tidy_data), ignore.case = TRUE)
> names(tidy_data) <- gsub("-std()", "STD", names(tidy_data), ignore.case = TRUE)
> names(tidy_data) <- gsub("-freq()", "Frequency", names(tidy_data), ignore.case = TRUE)
> names(tidy_data) <- gsub("angle", "Angle", names(tidy_data))
> names(tidy_data) <- gsub("gravity", "Gravity", names(tidy_data))
> 
> # Create a second, independent tidy data set with the average of each variable for each activity and each subject
> final_data <- tidy_data %>%
+   group_by(subject, activity) %>%
+   summarise_all(list(mean = mean))
> 
> # Save the final tidy data set
> write.table(final_data, "tidy_data.txt", row.name = FALSE)
> getwd()
[1] "C:/Users/panha/Documents"
> getwd()
[1] "D:/R/course"
> # Create the tidy data set with the average for each activity and each subject
> tidy_data <- selected_data %>%
+     group_by(subject, activity) %>%
+     summarise_all(mean)
Error: object 'selected_data' not found
> 
> # Write the tidy data set to a file
> write.table(tidy_data, "tidy_data.txt", row.name = FALSE)
> save.image("D:\\R\\course\\run_analysis")
> 
