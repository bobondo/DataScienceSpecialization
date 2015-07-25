# Author: Barry Obondo
# Data Science Specialization: Johns Hopkins University on Coursera
# Getting and Cleaning Data
# Quiz 1
###############################################################

setwd("C:/Users/jabondo/desktop/Dropbox/Coursera_DSS/3_GetData/quiz1")


## Question 1
## The American Community Survey distributes downloadable data about United States communities. 
## Download the 2006 microdata survey about housing for the state of Idaho using 
## download.file() from here: 
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
## and load the data into R. The code book, describing the variable names is here: 
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
## How many properties are worth $1,000,000 or more?

## DOWNLOAD FILE
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl1, destfile = "3_quiz1.csv")
dateDownloaded <- date()

## READ FILE
idahodata <- read.csv("3_quiz1.csv", sep = ",", header = TRUE)
head(idahodata)
names(idahodata)

## check the value of properties and table out to see <$1m
countmill <- length(idahodata$VAL[!is.na(idahodata$VAL) & idahodata$VAL==24])
countmill


#################### QUESTION 2 ##########################################
## Use the data you loaded from Question 1. 
## Consider the variable FES in the code book. Which of the
## "tidy data" principles does this variable violate?


#################### QUESTION 3 ##########################################
## Download the Excel spreadsheet on Natural Gas Aquisition Program here: 
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx 
## Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
##  dat 
## What is the value of:
##   sum(dat$Zip*dat$Ext,na.rm=T) 
## (original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)

## DOWNLOAD FILE
fileUrl3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl3, destfile = "3_quiz1.xlsx", mode="wb")

dateDownloaded <- date()

## read xlsx file
options(java.parameters = "-Xmx1000m")
#install.packages("xlsx")
library(xlsx)

dataAll <- read.xlsx("3_quiz1.xslx",  sheetIndex=1, header=TRUE)
head(dataAll)

colIndex <- 7:15
rowIndex <- 18:23
file4 <- "3_quiz1.xslx"

dat <- read.xlsx("3_quiz1.xslx", sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex)
dat

sum(dat$Zip*dat$Ext,na.rm=T) 


#################### QUESTION 4 ##########################################
## Read the XML data on Baltimore restaurants from here: 
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml 
## How many restaurants have zipcode 21231? 

## DOWNLOAD FILE
fileUrl4 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl4, destfile = "3_quiz1.xml")

# install.packages("XML")
library(XML)

# parse the XML from the URL
doc <- xmlTreeParse(fileUrl4, useInternal=TRUE)
rootNode <- xmlRoot(doc)
head(rootNode)

# find all zipcode tags
prezipcode <- xpathSApply(rootNode, "//zipcode", xmlValue)
prezipcode
length(prezipcode)
head(prezipcode)

# filter for specific zip code
zipspecific <- prezipcode[prezipcode==21231]
zipspecific

# return the number of zipcodes
length(zipspecific)


##############################QUESTION 5#####################################
## The American Community Survey distributes downloadable data about United States communities. 
## Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
## using the fread() command load the data into an R object DT Which of the following is the fastest way 
## to calculate the average value of the variable pwgtp15 broken down by sex using the data.table package?
# DT[,mean(pwgtp15),by=SEX]
# tapply(DTpwgtp15,DTSEX,mean)
# mean(DTpwgtp15,by=DTSEX)
# rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
# sapply(split(DTpwgtp15,DTSEX),mean)
# mean(DT[DT$SEX==1,]pwgtp15);mean(DT[DTSEX==2,]$pwgtp15)

## Strategy: write programs to calculate the mean, log system time and compare each

install.packages("data.table")
library(data.table)

# download file and note the time
fileUrl5 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl5, destfile = "UScommunities.csv", mode="wb" )
dateDownloaded <- date()
list.files()

# read the csv file
DT <- fread("UScommunities.csv")

# the following functions produce an error, and not desired output
# rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
# tapply(DT$pwgtp15,DT$SEX,mean)

# run each expression 1000 times and store the time taken
time_DT <- system.time(for (i in 1:1000) DT[,mean(pwgtp15),by=SEX])
time_sapply <- system.time(for (i in 1:1000) sapply(split(DT$pwgtp15,DT$SEX),mean))
time_tapply <- system.time(for (i in 1:1000) tapply(DT$pwgtp15,DT$SEX,mean))
time_mean1 <-system.time(for (i in 1:1000) mean(DT[DT$SEX==1,]$pwgtp15))     
time_mean2 <-system.time(for (i in 1:1000) mean(DT[DT$SEX==2,]$pwgtp15))
time_mean <- time_mean1 + time_mean2

time_DT 
time_sapply
time_mean1
time_mean2
# sapply is shortest
