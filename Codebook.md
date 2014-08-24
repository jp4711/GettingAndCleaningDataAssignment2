## Coursera 'Getting and Cleaning Data' Assessment 2

Raw Accelerometer data was obtained from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip,
Description of the original data can be found at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### The following steps are performed to generated required data sets

####Step 1: Merges the training and the test sets to create one data set.

* read xTrain and xTest data set and combine into xSet
* read yTrain, yTest data set and combine into ySet
* read subjectTrain and subjectTest data set and combine into subjectSet
* read activity map (map from id to label)
* read feature labels from txt file
* set column name for all data sets

####Step 2: Extracts only the measurements on the mean and standard deviation for each measurement

* select "mean" and "std" labels from feature labels
* get feature set using extracted labels 


####Step 3: Uses descriptive activity names to name the activities in the data set
* merge  activity dataset with descriptive labels

####Step 4: Appropriately labels the data set with descriptive variable names. 

* set features dataset with activity labels
featureSet <- cbind(meanStdFeatureSet, activitySet["activity"])
* write tidy feature data set to csv
write.csv(featureSet, "feature_set.txt")

####Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
* create data set with mean of activity/subject
* write activity-subject data set to csv

### Description of columns in feature.txt:

column   | description
---------|------------------------------
activity | descriptive label of activity

All other columns list the measurements as described in features_info.txt file.

### Description of columns in activity_subject_set.txt:

column   | description
---------|------------------------------
activity | descriptive label of activity
subject  | test subject id

All other columns list the measurements as described in features_info.txt file.

