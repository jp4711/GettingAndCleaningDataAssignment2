Analysis of Accelerometer Data for Coursera getdata-002 Assessment 2

Steps:

 - download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
 - extract downloaded file into root directory of project repository
 - run **rscript run_analysis.R** 
 
 This will result in two csv files being written:
 
 - feature_set.txt containing only mean and standard deviation of each measurement
 
 - activity_subject_set.txt containing the averages of mean and standard deviation of each  unique activity/subject measurment

Also, see the Codebook.md for details of extraction steps and columns in the two files.