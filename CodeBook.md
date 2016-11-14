CodeBook 
=================

This is the codebook for "run_analysis.csv", a combined, edited and cleaned dataset derived from crude data of the project "Human Activity Recognition Using Smartphones Dataset".

The experiments were conducted with 30 subjects, who were randomly distributed into two groups: "Training" (70%) and "Testing" (30%). Each subject was required to perform 6 activities (as described below); Data were collected over 2.56s fixed-width window at frequency of 50Hz (128 readings/window) via accelerometer and gyroscope, in the form of 3-axial raw signals tAcc-XYZ and tGyro-XYZ (prefix 't' to denote time). The acceleration signal was then separated into body/gravity acceleration signals, tBodyAcc-XYZ/tGravityAcc-XYZ. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals, tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ. Also the magnitude of these 3D signals were calculated using the Euclidean norm, namely tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (prefix 'f' to indicate frequency domain signals). 


For purpose of this project, the crude data of subject specification, activity label and "main" data sets (measurements along with some statistical results) for "Testing" and "Training" groups were combined respectively, followed by merging to make a total data set (10299 observations, 564 variables). 
Afterwards, only estimated mean and standard deviation values (i.e. variables containing "M/mean" or "std") were extracted, reducing variable number from 564 to 89. 
Further, average values of each variable for each subject/activity combination (i.e. of same "SUBJECT"/"ACTIVITY" numbers) were calculated, reducing observation number from 10029 to 400.
The final dataset is of 400 observations and 89 variables. 

ID - Newly created variable for merging purpose. It was re-assigned after all data management, so it eventually ranges from 1 to 400 (i.e. 400 subject/activity combinations). 
SUBJECT - Subject numbers, ranging from 1 to 30.
ACTIVITY - There were totally 6 types of activities that each of the subjects (might) be required to perform, namely "WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING".

Following Variables are means and standard deviation values estimated from original signals:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Additional vectors obtained by averaging the signals in a signal window sample were also retained:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

For more information, please read scripts and annotations in "README.md". 
