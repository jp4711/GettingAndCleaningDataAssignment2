
library(reshape2)

setwd("~/Courses/GitHub/projects/DataScience/GettingAndCleaningData/Assignment2")

#Step 1: Merges the training and the test sets to create one data set.

# read xTrain and xTest data set and combine into xSet
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
xSet <- rbind(xTrain, xTest)

# read yTrain, yTest data set and combine into ySet
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
ySet <- rbind(yTrain, yTest)

# read subjectTrain and subjectTest data set and combine into subjectSet
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjectSet <- rbind(subjectTrain, subjectTest)

# read activity map (map from id to label)
activityMap <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activityMap) <- c("activity_id", "activity")

# read feature labels from txt file
featureLabels <- read.table("UCI HAR Dataset/features.txt")[,"V2"]

# set column name for all data sets
colnames(xSet) <- featureLabels
colnames(ySet) <- "activity_id"
colnames(subjectSet) <- "subject"

#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

# select "mean" and "std" labels from feature labels
meanLabels <- grep("-mean\\(\\)", featureLabels, value=TRUE)
stdLabels <- grep("-std\\(\\)", featureLabels, value=TRUE)
meanStdFeatureLabels <- c(meanLabels, stdLabels)

# get feature set using extracted labels 
meanStdFeatureSet <- xSet[, meanStdFeatureLabels]

#Step 3: Uses descriptive activity names to name the activities in the data set

# merge  activity dataset with descriptive labels
activitySet <- merge(ySet, activityMap)

#Step 4: Appropriately labels the data set with descriptive variable names. 

# set features dataset with activity labels
featureSet <- cbind(meanStdFeatureSet, activitySet["activity"])
# write tidy feature data set to csv
write.csv(featureSet, "feature_set.txt")

#Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# create data set with mean of activity/subject
featureSubjectSet <- cbind(featureSet, subjectSet)
data2melt <- melt(featureSubjectSet, id=c("subject", "activity"))
meanSubjectActivitySet <- dcast(data2melt, activity + subject ~ variable, mean)

# write activity-subject data set to csv
#write.csv(meanSubjectActivitySet, "activity_subject_set.txt", row.name=FALSE)
write.table(meanSubjectActivitySet, "activity_subject_set.txt", row.name=FALSE)
