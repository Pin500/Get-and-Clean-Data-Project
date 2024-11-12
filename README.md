# Getting and Cleaning Data Project

This project is a demonstration of data cleaning using the UCI HAR Dataset collected from Samsung Galaxy S smartphones. 

## Files in the Repository
- `run_analysis.R`: Script for performing the data cleaning and transformation.
- `tidy_data.txt`: The final tidy data set.
- `CodeBook.md`: Description of the dataset variables and transformations.

## Data Cleaning Steps
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation.
3. Uses descriptive activity names for the activities in the dataset.
4. Labels the dataset with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Instructions
To run the analysis, open `run_analysis.R` in R and execute it. The script will download the data (if necessary), clean it, and produce a file named `tidy_data.txt`.
