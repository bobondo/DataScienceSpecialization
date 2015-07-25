# Author: Barry Obondo
# Data Science Specialization: Johns Hopkins University on Coursera
# Getting and Cleaning Data
# Quiz 4
###############################################################

setwd("C:/Users/jabondo/desktop/Dropbox/Coursera_DSS/3_GetData/quiz4")

# QUESTION 1
# The American Community Survey distributes downloadable data about United States communities. 
# Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
# and load the data into R. The code book, describing the variable names is here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
# Apply strsplit() to split all the names of the data frame on the characters "wgtp". 
# What is the value of the 123 element of the resulting list?

library(httr) 
surveydata <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(surveydata, destfile = "ss06hid.csv")
surveydatadict <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
download.file(surveydatadict, destfile="PUMSDataDict06.pdf")
data <- read.table("ss06hid.csv", header = TRUE, sep = ",")
x <- names(data)
y <- strsplit(x, "wgtp")
y[123]

# QUESTION 2
# Load the Gross Domestic Product data for the 190 ranked countries in this data set:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
# Remove the commas from the GDP numbers in millions of dollars and average them. 
# What is the average?
# Original data sources: http://data.worldbank.org/data-catalog/GDP-ranking-table 

library(data.table)
gdpdata <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(gdpdata, destfile="GDP.csv")
GDP <- data.table(read.csv("GDP.csv", skip = 4, nrows = 191))
GDP <- GDP[X != ""]
GDP <- GDP[, list(X, X.1, X.3, X.4)]
setnames(GDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", "Long.Name", "GDP"))
columnagdp <- as.numeric(gsub(",", "", GDP$GDP))
mean(columnagdp, na.rm = TRUE)

# QUESTION3
# In the data set from Question 2 what is a regular expression that would allow you to  
# count the number of countries whose name begins with "United"? 
# Assume that the variable with the country names in it is named countryNames. 
# How many countries begin with United? 
# grep("^United",countryNames), 4
# grep("United$",countryNames), 3
# grep("^United",countryNames), 3
# grep("*United",countryNames), 2 

isUnited <- grepl("^United", GDP$Long.Name)
summary(isUnited)

# QUESTION 4
# Load the Gross Domestic Product data for the 190 ranked countries in this data set:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
# Load the educational data from this data set:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
# Match the data based on the country shortcode. 
# Of the countries for which the end of the fiscal year is available, 
# how many end in June?
# Original data sources:
# http://data.worldbank.org/data-catalog/GDP-ranking-table
# http://data.worldbank.org/data-catalog/ed-stats 

gdpdata2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(gdpdata2, destfile="GDP.csv")
preGDP <- data.table(read.csv("GDP.csv"))

GDP <- preGDP[4:nrow(preGDP)]
head(GDP)
setnames(GDP,"Gross.domestic.product.2012","CountryCode")

gdpdata3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(gdpdata3, destfile="EDSTATS_Country.csv")
EDSTATS <- data.table(read.csv("EDSTATS_Country.csv"))
data2 <- merge(GDP, EDSTATS, all = TRUE, by =c("CountryCode"))
FiscalYearEnd <- grepl("fiscal year end", tolower(data2$Special.Notes))
isJune <- grepl("june", tolower(data2$Special.Notes))
table(FiscalYearEnd, isJune)

# QUESTION 5
# You can use the quantmod (http://www.quantmod.com/) package to get historical 
# stock prices for publicly traded companies on the NASDAQ and NYSE. 
# Use the following code to download data on Amazon's stock price and 
# get the times the data was sampled.
# How many values were collected in 2012? 
# How many values were collected on Mondays in 2012?

install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

addmargins(table(year(sampleTimes), weekdays(sampleTimes)))

