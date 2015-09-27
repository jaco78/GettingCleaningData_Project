# GettingCleaningData_Project
Repo for storing results of the Course project for the Getting and Cleaning Data Course

This repo contains:
1. This "README.md" file
2. The R-script 'run_analysis.R'
3. The code book "CodeBook.md"

2. The R-script 'run_analysis.R'
--------------------------------

With this repo I share the script 'run_analysis.R'. This script uses data on wearable computing and produces a tidy data set that can be used for further analysis.  

The R script "run_analysis.R" creates a tidy dataset starting from the dataset:
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
downloaded 25/09/2015

The software and platform used:
- language       R                           
- version.string R version 3.1.3 (2015-03-09)
- nickname       Smooth Sidewalk  
- platform: windows 7


The script:
0. downloads and unzips the Samsung dataset in your working directory.
1. Merges the training and the test sets to create one data set.
2. Appropriately labels the data set with descriptive variable names.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. Writes the latter dataset as a text file "result.txt" to your working directory.
See 'run_analysis.R' for more details


The resulting dataset can be read into R using the commands:
read <- read.table("result.txt", header = T)
View(read)


3. The CodeBook contains 
