Author: Barry Obondo
Data Science Specialization: Johns Hopkins University on Coursera
Getting and Cleaning Data
**Project:** Develop Tidy Data Set from Samsung S4 Activity Raw Data


CODEBOOK
==

Data Source
--
Data used here was collected in 2013 by the Human Activity Recognition Using Smartphones project team at Smartlab - Non-Linear Complex Systems Laboratory DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy and CETpD - Technical Research Centre for Dependency Care and Autonomous Living Universitat Politècnica de Catalunya (BarcelonaTech), Barcelona, Spain.[^Ref1] [^Ref2] The data was accessed from the Machine Learning Repository, Centre for Machine Learning and Intelligent Systems, University of Carlifonia, Irvine.[^Ref3] [^Ref4] 

The experiment involved 30 volunteers within the ages of 19-48 years who performed six activities (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying) while wearing a Samsung Galaxy S II smartphone on the waist. The smartphone captured 3-axial linear acceleration and 3-axial angular velocity using its accelorometer and gyroscope at a stable rate of 50Hz. The activities were video-taped to facilitate labelling the data manually.
The obtained datasets were randomly split into two: 70% = training datasets, 30% = test datasets.

---
Identifiers
----------
**subject** - the ID number of the test or training volunteer
**activity** - the type of activity performed when corresponding measurement was taken

Features
--
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern.
F
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Feature Selection
--
The set of features selected for inclusion in the tidy data set are features with measures of 

 - **mean()**: mean value
 - **std():**: standard deviation

The complete set of selected 66 features are as follows:

tBodyAcc mean()	X
tBodyAcc mean()	Y
tBodyAcc mean()	Z
tGravityAcc mean()	X
tGravityAcc mean()	Y
tGravityAcc mean()	Z
tBodyAccJerk mean()	X
tBodyAccJerk mean()	Y
tBodyAccJerk mean()	Z
tBodyGyro mean()	X
tBodyGyro mean()	Y
tBodyGyro mean()	Z
tBodyGyroJerk mean()	X
tBodyGyroJerk mean()	Y
tBodyGyroJerk mean()	Z
tBodyAccMag mean()	
tGravityAccMag mean()	
tBodyAccJerkMag mean()	
tBodyGyroMag mean()	
tBodyGyroJerkMag mean()	
fBodyAcc mean()	X
fBodyAcc mean()	Y
fBodyAcc mean()	Z
fBodyAccJerk mean()	X
fBodyAccJerk mean()	Y
fBodyAccJerk mean()	Z
fBodyGyro mean()	X
fBodyGyro mean()	Y
fBodyGyro mean()	Z
fBodyAccMag mean()	
fBodyBodyAccJerkMag mean()	
fBodyBodyGyroMag mean()	
fBodyBodyGyroJerkMag mean()	
tBodyAcc std()	X
tBodyAcc std()	Y
tBodyAcc std()	Z
tGravityAcc std()	X
tGravityAcc std()	Y
tGravityAcc std()	Z
tBodyAccJerk std()	X
tBodyAccJerk std()	Y
tBodyAccJerk std()	Z
tBodyGyro std()	X
tBodyGyro std()	Y
tBodyGyro std()	Z
tBodyGyroJerk std()	X
tBodyGyroJerk std()	Y
tBodyGyroJerk std()	Z
tBodyAccMag std()	
tGravityAccMag std()	
tBodyAccJerkMag std()	
tBodyGyroMag std()	
tBodyGyroJerkMag std()	
fBodyAcc std()	X
fBodyAcc std()	Y
fBodyAcc std()	Z
fBodyAccJerk std()	X
fBodyAccJerk std()	Y
fBodyAccJerk std()	Z
fBodyGyro std()	X
fBodyGyro std()	Y
fBodyGyro std()	Z
fBodyAccMag std()	
fBodyBodyAccJerkMag std()	
fBodyBodyGyroMag std()	
fBodyBodyGyroJerkMag std()

Tidy Data
--
The **run_analysis.R** script was developed and run on RStudio (Version 0.99.467). 
The final output of the program ***tidy_data.txt***(221kb) and ***tidy_data.csv*** (221kb).

REFERENCES
-----

[^Ref1] Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto.  Smartlab - Non-Linear Complex Systems Laboratory DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
[^Ref2] Jorge L. Reyes-Ortiz and Xavier Parra. CETpD - Technical Research Centre for Dependency Care and Autonomous Living Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain activityrecognition '@' smartlab.ws
[^Ref3] Lichman, M. (2013). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, School of Information and Computer Science. Available from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones Accessed: June 17, 2015.
[^Ref4] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.




> Written with [StackEdit](https://stackedit.io/).