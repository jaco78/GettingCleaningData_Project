# This R script "run_analysis.R" creates a tidy dataset starting from this dataset:
# "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# language       R                           
# version.string R version 3.1.3 (2015-03-09)
# nickname       Smooth Sidewalk  
# platform: windows 7


# The script:
# 0. downloads and unzips the Samsung dataset in your working directory.
# 1. Merges the training and the test sets to create one data set.
# 2. Appropriately labels the data set with descriptive variable names.
# 3. Extracts only the measurements on the mean and standard deviation for each measurement.
# 4. Uses descriptive activity names to name the activities in the data set
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and
# each subject.


## 0. download and unzip the data to the working directory
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")
unzip("dataset.zip") #data in directory "UCI HAR Dataset"

## 1. Merges the training and the test sets to create one data set.
#read in test and training data sets
test_act <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_set <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
train_act <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_set <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#combine subject, activity, and features for test datasets
test <- cbind(test_subject, test_act, test_set )
#combine subject, activity, and features for training datasets
train <- cbind(train_subject, train_act, train_set)
#combine test and training datasets
complete <- rbind(test, train)

## 2. Appropriately labels the data set with descriptive variable names --> create column names
#read in List of all features: 2nd column in file features.txt
feat <- read.table("./UCI HAR Dataset/features.txt", colClasses = "character")[,2]
colnames(complete) <- c("subject", "activity", feat)
colnames(complete)

## 3. Extract only the measurements on the mean and standard deviation for each measurement.
#The script only extracts the features which names contain extensions "-mean()" or "-std()", as stated in "features_info.txt"
#It does not extract columns like  fBodyBodyGyroJerkMag-meanFreq() or angle(tBodyAccJerkMean),gravityMean) which also contain "means" but not the means we are interested in.   

meancols <- grep("-mean()",colnames(complete))
stdcols <- grep("-std()", colnames(complete))
select_cols <- c(1, 2, meancols, stdcols)

dataset <- complete[, select_cols]
# colnames(dataset)

## 4. Uses descriptive activity names to name the activities in the data set.
#read in activity descriptions
activity <- read.table("./UCI HAR Dataset/activity_labels.txt", colClasses = "character")
#set activity as a factor variable with levels 1:6 and label the activities according to the file activity_labels.txt
dataset$activity <- factor(dataset$activity, levels = 1:6, labels = activity[,2])


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
Result <- (group_by(dataset, subject, activity) %>% summarise_each(funs(mean)) %>% ungroup)

#export result as txt-file
write.table(Result, "result.txt", row.name = FALSE)

#Post-processing: After creating the result.txt file, in Notepad++ (using CTRL+h) change the column names 
#so that they don't contain special characters like '(', ')', '-'
#e.g.  'tBodyAcc-mean()-X' becomes  'tBodyAcc_mean_X' 

## To import the dataset to R:
# read <- read.table("result.txt", header = T)
# View(read)

##tests
# mean(filter(dataset, subject == 1 & activity == "WALKING")[,3])
# mean(filter(dataset, subject == 1 & activity == "WALKING")[,4])
# mean(filter(dataset, subject == 1 & activity == "WALKING")[,5])
# mean(filter(dataset, subject == 2 & activity == "WALKING_UPSTAIRS")[,3])
# mean(filter(dataset, subject == 3 & activity == "LAYING")[,4])
# mean(filter(dataset, subject == 4 & activity == "WALKING")[,5])
