#Getting and Cleaning Data Project

##Description

This code book summarizes the resulting data fields in tidy.txt. 


##What the Raw Data Comprises

A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data set contains readings from experiments on recognising human activity, which was carried out with a group of 30 volunteers within an age bracket of 19-48 years. 

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. A video of the experiment including an example of the 6 recorded activities with one of the participants is available [here](http://www.youtube.com/watch?v=XOEN9W05_4A). The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The readings in this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

**Signals**
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

Two kinds of **variables** that were estimated from these signals are: 
* mean(): Mean value
* std(): Standard deviation

There are other variables, but they are not relevant for this project.

For every **signal** in the list above, each type of **variable** estimate is computed. 

For example:
* The variable _fBodyAcc-mean()-X_ contains the mean estimate of the the _tBodyAcc-X_ signal. 
* Similarly, _fBodyAcc-std()-Y_ contains the standard deviation estimate of the fBodyAcc-Y signal.

Multiple readings were taken for each activity, for each subject. Consequently, there are also multiple rows containing observations of every signal and its variable estimates in the data set.


##What the Tidied Data Comprises
This data set contains the average of each mean and standard deviation variable for each activity and each subject


### Identifiers
* Subject - The unique ID of the test subject
* Activity - The type of activity performed when the corresponding measurements were taken
 * Activity Types
   * WALKING: subject was walking during the test
   * WALKING_UPSTAIRS: subject was walking up a staircase during the test
   * WALKING_DOWNSTAIRS: subject was walking down a staircase during the test
   * SITTING: subject was sitting during the test
   * STANDING: subject was standing during the test
   * LAYING: subject was laying down during the test

### Measurements
To reflect that columns now contain averages, variable/column labels were renamed. With reference to signals from the original data set (listed in "What the Raw Data Comprises >> Signals" above), the tidied output variable labels can be understood using the following nomenclature:

**Avg** + _ + **signal name** + _ + **estimate type (either mean or std deviation)** + _ + **X or Y or Z**

For example:
* _Avg_fBodyAccJerk_Std_X_ is the average  _fBodyAccJerk-std()-X_ per subject per activity
* _Avg_tBodyAcc_Mean_X_ is the average of _fBodyAcc-mean()-X_ per subject per activity

