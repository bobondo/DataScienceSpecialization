# Author: Barry Obondo
# Data Science Specialization: Johns Hopkins University on Coursera
# Getting and Cleaning Data
# Quiz 1
###############################################################

setwd("C:/Users/jabondo/desktop/Dropbox/Coursera_DSS/3_GetData/quiz2")

###### QUIZ 2 #####################
###################################
# install.packages("RMySQL") # comment line out after install
# install.packages("httr") # comment line out after install
# install.packages("rhdf5") # comment line out after install
# install.packages("sqldf") # comment line out after install

## QUESTION 1
## Register an application with the Github API here https://github.com/settings/applications. 
## Access the API to get information on your instructors repositories 
## (hint: this is the url you want "https://api.github.com/users/jtleek/repos"). 
## Use this data to find the time that the datasharing repo was created. 
## What time was it created? 
## This tutorial may be useful (https://github.com/hadley/httr/blob/master/demo/oauth2-github.r). 
## You may also need to run the code in the base R package and not R studio.

# ANS

# Load Library
library(httr)

# create object for registered application
oauth_endpoints("github") 
dss_3_getdata <- oauth_app("github", "449817f2e05981226e13", "36fb9b72f9f1485d52bf166c33211c656d9d8339")
                        
# get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), dss_3_getdata)
             
# set up configuration with token for configuration
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)

# load url
BROWSE("https://api.github.com/users/jtleek/repos",authenticate("Access Token","x-oauth-basic","basic"))

                         
                         
## QUESTION 2
## The sqldf package allows for execution of SQL commands on R data frames. 
## We will use the sqldf package to practice the queries we might send with the dbSendQuery command in RMySQL. 
## Download the American Community Survey data and load it into an R object called
## acs
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 
## Which of the following commands will select only the data for the 
## probability weights pwgtp1 with ages less than 50?
     
# sqldf("select pwgtp1 from acs where AGEP < 50")
# sqldf("select pwgtp1 from acs")
# sqldf("select * from acs where AGEP < 50 and pwgtp1")
# sqldf("select * from acs where AGEP < 50")
                 
library(sqldf)
acs <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", header=T, sep=",")
head(acs)
                 
testsol1 <- sqldf("select pwgtp1 from acs where AGEP < 50")
testsol2 <- sqldf("select pwgtp1 from acs")
testsol3 <- sqldf("select * from acs where AGEP < 50 and pwgtp1")
testsol4 <- sqldf("select * from acs where AGEP < 50")
                         
testsol1 
testsol2
testsol3
testsol4 
                         
                         
                         
## QUESTION 3
## Using the same data frame you created in the previous problem, 
## what is the equivalent function to 
## 
unique(acs$AGEP)   
                         
## QUESTION 4
## How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page: 
## http://biostat.jhsph.edu/~jleek/contact.html 
## (Hint: the nchar() function in R may be helpful)
                         
hurl <- "http://biostat.jhsph.edu/~jleek/contact.html"
con <- url(hurl)
htmlCode <- readLines(con)
close(con)
sapply(htmlCode[c(10, 20, 30, 100)], nchar)

## QUESTION 5
## Read this data set into R and report the sum of the numbers in the fourth of the nine columns. 
## https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for 
## Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for 
## (Hint this is a fixed width file format)

data <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", header=T)
head(data)
dim(data)
file_name <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
df <- read.fwf(file=file_name,widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
head(df)
sum(df[, 4])

