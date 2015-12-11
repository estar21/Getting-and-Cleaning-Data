##Getting and Cleaning Data Project


###Description

This contains information about the data set, its variables, and a description of transformations used for cleaning the data. This is part of a course project submission for the Johns Hopkins Getting and Cleaning Data course.


###Source Data

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

###Data Set Information

A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data set contains readings from experiments on recognising human activity, which was carried out with a group of 30 volunteers within an age bracket of 19-48 years. 

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. A video of the experiment including an example of the 6 recorded activities with one of the participants is available [here](http://www.youtube.com/watch?v=XOEN9W05_4A). The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


###Attribute Information

For each record in the dataset it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.


###Transformations performed to clean up the data using run_analysis.R:

1. Check working directory for source data. Download and unzip if it does not exist
2. Read in "activity_labels.txt" and "features.txt"
3. Extract only the names of measurements that contain the mean and standard deviation. DO NOT take col names "gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean". These were applied on the angle() estimate, and should not be included)
4. Make names from step 3 descriptive and store in a seperate vector for renaming variables in the combined data set later. (Nomenclature for naming convention: <feature>_<mean|std>_<X|Y|Z>)
5. Read in train data files "subject_train.txt", "X_train.txt" and "y_train.txt", (pulling only columns shortlisted in step 3) and combine them into one dataframe
6. Read in test data files "subject_test.txt", "X_test.txt" and "y_test.txt", (pulling only columns shortlisted in step 3) and combine them into one dataframe
7. Combine dataframes from 5 and 6 into a new data frame
8. Appropriately label the new data frame from step 7 with descriptive variable names from step 4.
9. Create a second, independent tidy data set with the average of each variable for each activity and each subject. (Use group_by and summarise from dplyr)
10. Rename columns of data frame from step 9 to indicate they are averages of the original columns.
11. Output the file containing averages for each variable for each activity and each subject as "tidied_averages.txt"
