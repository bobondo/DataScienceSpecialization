# Author: Barry Obondo
# Data Science Specialization: Johns Hopkins University on Coursera
# Getting and Cleaning Data
# Project
###############################################################

# One of the most exciting areas in all of data science right now is wearable computing. 
# Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced 
# algorithms to attract new users. The data linked to from the course website represent 
# data collected from the accelerometers from the Samsung Galaxy S smartphone. 
# A full description is available at the site where the data was obtained: 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# Here are the data for the project: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#  You should create one R script called run_analysis.R that does the following. 
#   1) Merges the training and the test sets to create one data set.
#   2) Extracts only the measurements on the mean and standard deviation for each measurement. 
#   3) Uses descriptive activity names to name the activities in the data set
#   4) Appropriately labels the data set with descriptive variable names. 
#   5) From the data set in step 4, creates a second, independent tidy data set 
#      with the average of each variable for each activity and each subject.

###############################################################

setwd("C:/Users/jabondo/desktop/Dropbox/Coursera_DSS/3_GetData/project")
# setwd("C:/Users/barry_000/Desktop/Dropbox/Coursera_DSS/3_GetData/project")
# setwd("C:/data/Dropbox/Coursera_DSS/project")

library(plyr)
filename <- "getdata_project_dataset.zip"

# download dataset file if does not exist
if(!file.exists(filename)){
    datasetURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(datasetURL, destfile="getdata_project_files_UCI_HAR_Dataset.zip")}
# unzip dataset if not yet unzipped
if (!file.exists("UCI HAR Dataset")) {
    unzip("getdata_project_files_UCI_HAR_Dataset.zip")
}   

# STEP 1: LOAD AND PREPARE FEATURES AND ACTIVITIES
# 1.1 read features
features <- read.table("UCI HAR Dataset/features.txt", sep="", header=FALSE)

# 1.2 extract selected features (i.e. mean and std)
selected_features <- grep("-(mean|std)\\(\\)", features[,2])

# 1.3 read activity labels
activityNames <- read.table("UCI HAR Dataset/activity_labels.txt")

# STEP 2: LOAD TRAINING AND TEST DATA SETS, SUBST SELECTED COLUMNS,  TO CREATE ONE DATA SET

# 2.1 read training sets (x,y, and subject)
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# 2.2 read test sets (x,y, and subject)
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# STEP 3: MERGE TRAINING AND TEST DATASETS, SUBSET SELECTED COLUMNS, RENAME VARIABLES AND CREATE ONE DATA SET

# 3.1 merge training and test x, y and subject data sets
x_data <-rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# 3.2 subset selected features in x data set
x_data <- x_data[, selected_features]

# 3.3 rename x, y and subject column names
y_data[,1] <- activityNames[y_data[,1], 2]
names(x_data) <- features[selected_features, 2]
names(y_data) <- "activity"
names(subject_data) <- "subject"

# 3.4 create one data set from all x,y, subject data
all_data <- cbind(x_data, y_data, subject_data)
# head(all_data)


# Step 4: CREATE INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF 
# EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT

# 4.1 create dataset 
tidy_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(tidy_data, "tidy_data.txt")

# 4.2 create csv
 write.csv(tidy_data, file = "tidy_data.csv")
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  