# Code Book
###### DATA DICTIONARY FOR `CLEAN DATA SET` GENERATED WITH SAMSUNG DATA

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals `tAcc-XYZ` and `tGyro-XYZ`.
Column names fall into the following major categories:

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The calculations present in the data set are (all others have been excluded but could be found in the source data files):
- mean(): Mean value
- std(): Standard deviation

The resulting data set contains a mean for each of the measurements grouped by:
- Subject (column 1)- the person who participated in the study, there are 30 of them in total.
- Activity (column 2) - each subject who participated in the study performed 6 activities.

The total number of rows thus is:

30 x 6 = 180