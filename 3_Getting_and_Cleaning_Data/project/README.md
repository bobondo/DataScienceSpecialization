
Author: Barry Obondo
Data Science Specialization: Johns Hopkins University on Coursera
Getting and Cleaning Data
**Project:** Develop Tidy Data Set from Samsung S4 Activity Raw Data


README
=====
The R script **run_analysis.R** was developed in RStudio (Version 0.99.467).

The script does the following:

 1.  Downloads the data set UCI HAR Dataset from the course provided link: 
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    
 2. Reads features from ***features.txt*** and extracts selected features (mean and std)
 3. Reads activity labels  from ***activity_labels.txt*** 
 4. Reads training data sets for **x**, **y**, and **subject** data from ***X_train.txt***, ***Y_train.txt***, and ***subject_train.txt*** respectively
 5. Reads test data sets for x, y, and subjects from ***X_test.txt***, ***Y_test.txt***, and ***subject_test.txt*** respectively
 6. Selects columns with selected features from the **x** data
 7. Renames **x**, **y**, and **subject** column names to descriptive variable names
 8. Merges **x**, **y**, and **subject** data sets into one data set
 9. Creates independent tidy data set with the average of each variable for each activity and each subject

The end result is shown in the file **tidy.txt**