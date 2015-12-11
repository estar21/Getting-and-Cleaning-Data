##Getting and Cleaning Data Course Project

Repo for the submission of the course project for the Johns Hopkins Getting and Cleaning Data course.

###Overview

This project demonstrates the collection and cleaning of data into a tidy data set that can be used for subsequent analysis. A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


###Project Summary
An R script, run_analysis.R has been created to do the following:

1. Merge the training and the test sets to create one data set. 
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set 
4. Appropriately label the data set with descriptive activity names. 
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.


###How to Use This Script

This script automatically checks your working directory for source files and downloads them if they do not exist. The script then performs steps 1-5 listed above, and outputs the final tidy data set to a file.

The output is a file called "tidied_averages.txt", created in your working directory. You may run further analysis on this tidied data set as needed.


###Additional Information

Additional information is available in the CodeBook.MD file for the following:

1. Information about the data and how it was collected
2. Information about variables, 
3. Step-by-Step transformations applied on the data with run_analysis.R
