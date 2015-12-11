# 1 Check working directory for source data. Download and unzip if it does not exist
filename <- "getdata_projectfiles_UCI HAR Dataset.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="auto",mode="wb") # (method="curl" does not work on my windows machine. mode="wb" produces binary output for windows systems)
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}



# 2 Read in activity labels and features
library(data.table)

activityLabels <- fread("UCI HAR Dataset\\activity_labels.txt",data.table=FALSE) # table for activity labels
features <- fread("UCI HAR Dataset\\features.txt",data.table=FALSE) # table for features

# 3 Extract only the names of measurements that contain the mean and standard deviation. 
# Extract names of measures for mean and standard deviation observations. Use these to pull only columns we want from "trainSet" and "testSet" below
meanPlusStd <- grep(".*mean.*|.*std.*", features[,2]) # DO NOT take col names "gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean". These were applied on the angle() estimate. They are not measurements and should not be included
meanPlusStdNames <- features[meanPlusStd,2]

# 4 Make names descriptive. (Nomenclature for naming convention: <feature>_<mean|std>_<X|Y|Z>)
meanPlusStdNames <- gsub('[()]', '', meanPlusStdNames)
meanPlusStdNames = gsub('std', 'Std', meanPlusStdNames) 
meanPlusStdNames = gsub('mean', 'Mean', meanPlusStdNames)
meanPlusStdNames = gsub('-', '_', meanPlusStdNames)


# 5 Read in train data, (pulling only columns shortlisted in step 3) and combine them into one dataframe
trainSubj <- fread("UCI HAR Dataset\\train\\subject_train.txt",data.table=FALSE) # training subjects
trainSet <- fread("UCI HAR Dataset\\train\\X_train.txt",data.table=FALSE)[meanPlusStd] # table for training set
trainLabels <- fread("UCI HAR Dataset\\train\\y_train.txt",data.table=FALSE) # table for training set labels
traindf <- cbind(trainSubj, trainLabels, trainSet)

# 6 Read in test data, (pulling only columns shortlisted in step 3) and combine them into one dataframe
testSubj <- fread("UCI HAR Dataset\\test\\subject_test.txt",data.table=FALSE) # test subjects
testSet <- fread("UCI HAR Dataset\\test\\X_test.txt",data.table=FALSE)[meanPlusStd]  # table for test set
testLabels <- fread("UCI HAR Dataset\\test\\y_test.txt",data.table=FALSE) # table for testset labels
testdf <- cbind(testSubj, testLabels, testSet)

# 7 Combine the data sets
combined <- rbind(testdf,traindf) # combine train and test datasets

# 8 Appropriately label the data set with descriptive variable names.
colnames(combined) <- c("Subject", "Activity", meanPlusStdNames)
combined$Subject <- as.character(combined$Subject)
combined$Subject <- as.factor(combined$Subject) # factorise Subject
activityLabels[,2] <- as.character(activityLabels[,2]) # factorise and assign descriptive Activity labels
combined$Activity <- factor(combined$Activity, levels = activityLabels[,1], labels = activityLabels[,2])


# 9 Create a second, independent tidy data set with the average of each variable for each activity and each subject
library(dplyr)
library(tidyr)
newDf <- combined %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))

#10 Rename columns to indicate they are averages
newNames <- vector()
for (i in meanPlusStdNames){
  newi <- paste0("Avg_",i)
  newNames <- c(newNames, newi)
}
colnames(newDf) <- c("Subject", "Activity", newNames)


# 11 Ouput the file with averages
write.csv(newDf,"tidied_averages.txt",row.names = FALSE)