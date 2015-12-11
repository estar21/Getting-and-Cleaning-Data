##Getting and Cleaning Data Course Project

Repo for course project submissions for the Johns Hopkins Getting and Cleaning Data course.


###Overview

This project demonstrates the collection and cleaning of data into a tidy data set that can be used for subsequent analysis. A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The project requires students to write an R script, run_analysis.R to do the following:

1. Merge the training and the test sets to create one data set. 
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set 
4. Appropriately label the data set with descriptive activity names. 
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.


###How to Use [run_analysis.R](https://github.com/estar21/Getting-and-Cleaning-Data/blob/master/run_analysis.R) in this Repo

This script automatically checks your working directory for source files and downloads them if they do not exist. The script then performs steps 1-5 listed above, and outputs the final tidy data set to a file.

The output is a file called "tidied_averages.txt", created in your working directory. You may run further analysis on this tidied data set as needed.


###Details of transformations performed to clean up the data using run_analysis.R:

1. Check working directory for source data. Download and unzip if it does not exist
2. Read in "activity_labels.txt" and "features.txt"
3. Extract only the names of measurements that contain the mean and standard deviation. (DO NOT take col names "gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean". These were applied on the angle() estimate, and should not be included)
4. Make names from step 3 descriptive and store in a seperate vector. Use this to rename variables in the combined data set later. (Nomenclature for naming convention: feature_mean|std_X|Y|Z)
5. Read in train data files "subject_train.txt", "X_train.txt" and "y_train.txt", (pulling only columns shortlisted in step 3) and combine them into one dataframe
6. Read in test data files "subject_test.txt", "X_test.txt" and "y_test.txt", (pulling only columns shortlisted in step 3) and combine them into one dataframe
7. Combine dataframes from 5 and 6 into a new data frame
8. Appropriately label the new data frame from step 7 with descriptive variable names from step 4.
9. Create a second, independent tidy data set with the average of each variable for each activity and each subject. (Use group_by and summarise from dplyr)
10. Rename columns of data frame from step 9 to indicate they are averages of the original columns.
11. Output the file containing averages for each variable for each activity and each subject as "tidied_averages.txt"


###Additional Information

Additional information is available in the CodeBook.MD file for the following:

1. Information about the data and how it was collected
2. Information about variables, activity labels, etc
