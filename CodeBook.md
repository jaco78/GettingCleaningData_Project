The file 'result.txt' was produced by running the script 'run_analysis.R' 
with software and platform:
- language       R                           
- version.string R version 3.1.3 (2015-03-09)
- nickname       Smooth Sidewalk  
- platform: windows 7

and subsequently post-processing the txt-file by opening it in Notepad++ and changing the column names (using CTRL+h) so that they don't contain special characters like '(', ')', '-' 
e.g. 'tBodyAcc-mean()-X' becomes 'tBodyAcc_mean_X' 

'result.txt' can be read into R (assuming it is located in the working directory) using
read <- read.table("result.txt", header = T)
View(read)

The original dataset was dowloaded on 2015-09-25 from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

The original dataset contained measurements on 651 variables for a group of 30 volunteers carrying out 6 activities; for more info on the dataset see the README.txt and information files available from the link above.
For the current dataset "result.txt' only the variables with data on mean and standard deviations were retained.
For each of the variables a mean value was computed per subject (volunteer) and activity.

"result.txt" contains 180 rows (30 volunteers x 6 activities) and 81 variables.
The first 2 variables 'subject' and 'activity' contain the volunteer id and activity label. 
The following columns contain values for 79 variables which are the averages of the measurements in the original dataset for that variable per subject (volunteer) and activity. 

Thus 'result.txt' contains the columns listed below:

subject: volunteer ID ranging from 1 to 30
activity: 6 activity labels: "WALKING", "WALKING_UPSTAIRS", 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING'
tBodyAcc_mean_X: averaged value of measurements per subject and activity. Values are bounded within [-1,1] (this holds for the next 78 variables)
tBodyAcc_mean_Y: idem
tBodyAcc_mean_Z: idem
tGravityAcc_mean_X: idem
tGravityAcc_mean_Y: etc
tGravityAcc_mean_Z
tBodyAccJerk_mean_X
tBodyAccJerk_mean_Y
tBodyAccJerk_mean_Z
tBodyGyro_mean_X
tBodyGyro_mean_Y
tBodyGyro_mean_Z
tBodyGyroJerk_mean_X
tBodyGyroJerk_mean_Y
tBodyGyroJerk_mean_Z
tBodyAccMag_mean
tGravityAccMag_mean
tBodyAccJerkMag_mean
tBodyGyroMag_mean
tBodyGyroJerkMag_mean
fBodyAcc_mean_X
fBodyAcc_mean_Y
fBodyAcc_mean_Z
fBodyAcc_meanFreq_X
fBodyAcc_meanFreq_Y
fBodyAcc_meanFreq_Z
fBodyAccJerk_mean_X
fBodyAccJerk_mean_Y
fBodyAccJerk_mean_Z
fBodyAccJerk_meanFreq_X
fBodyAccJerk_meanFreq_Y
fBodyAccJerk_meanFreq_Z
fBodyGyro_mean_X
fBodyGyro_mean_Y
fBodyGyro_mean_Z
fBodyGyro_meanFreq_X
fBodyGyro_meanFreq_Y
fBodyGyro_meanFreq_Z
fBodyAccMag_mean
fBodyAccMag_meanFreq
fBodyBodyAccJerkMag_mean
fBodyBodyAccJerkMag_meanFreq
fBodyBodyGyroMag_mean
fBodyBodyGyroMag_meanFreq
fBodyBodyGyroJerkMag_mean
fBodyBodyGyroJerkMag_meanFreq
tBodyAcc_std_X
tBodyAcc_std_Y
tBodyAcc_std_Z
tGravityAcc_std_X
tGravityAcc_std_Y
tGravityAcc_std_Z
tBodyAccJerk_std_X
tBodyAccJerk_std_Y
tBodyAccJerk_std_Z
tBodyGyro_std_X
tBodyGyro_std_Y
tBodyGyro_std_Z
tBodyGyroJerk_std_X
tBodyGyroJerk_std_Y
tBodyGyroJerk_std_Z
tBodyAccMag_std
tGravityAccMag_std
tBodyAccJerkMag_std
tBodyGyroMag_std
tBodyGyroJerkMag_std
fBodyAcc_std_X
fBodyAcc_std_Y
fBodyAcc_std_Z
fBodyAccJerk_std_X
fBodyAccJerk_std_Y
fBodyAccJerk_std_Z
fBodyGyro_std_X
fBodyGyro_std_Y
fBodyGyro_std_Z
fBodyAccMag_std
fBodyBodyAccJerkMag_std
fBodyBodyGyroMag_std
fBodyBodyGyroJerkMag_std
