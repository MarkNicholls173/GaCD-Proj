---
title: "README"
author: "Mark Nicholls"
date: "13/02/2021"
output: html_document
---

## Getting and Cleaning data course project

This file explains the run_analysis.R file I have made to submit for the end of course project assignment.

It use twos libraries; dplyr and tidyr, as introduced during the course.

```
#load required packages
library(dplyr) # for the mutate, group_by and summarise commands
library(tidyr) # for pivot_longer and pivot_wider commands
```

The script reads the required data from the test and train data sets, adds the subject and activity information, and merges them into one data frame, called df_test_train, as per requirement 1. Also, the descriptive variable names are added, as provided in features.txt, as per requirement 4.

```
#get variable names, common to both test and train
col_names <- read.table("./UCI HAR Dataset/features.txt")[[2]]

#load test data
df_xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
names(df_xtest) <- col_names # set the variable names

#load the test activity data
df_ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
names(df_ytest) <- c("Activity") # set the variable name

#load test subject data
df_sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(df_sub_test) <- c("Subject") # set the variable name

#combine the test data
df_test_com <- cbind(df_sub_test, df_ytest, df_xtest)

#load train data
df_xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
names(df_xtrain) <- col_names # set the variable names

#load the train activity data
df_ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
names(df_ytrain) <- c("Activity") # set the variable name

#load train subject data
df_sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(df_sub_train) <- c("Subject") # set the variable name

#combine the train data
df_train_com <- cbind(df_sub_train, df_ytrain, df_xtrain)

#combine test and train data
df_test_train <- rbind(df_test_com, df_train_com)

#clean up environment
rm(col_names, 
   df_xtest, df_ytest, df_test_com, df_sub_test, 
   df_xtrain, df_ytrain, df_train_com, df_sub_train)

```

Then the data frame as altered to only include variables for mean and standard deviation measurements, as per requirement 2. this is done by using grep and a regular expression to match the kept columns

```
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement.
df_test_train <- df_test_train[,grep("Subject|Activity|[mM]ean|std", 
                                     names(df_test_train))]
```

Then to replace the activity number with a meaningful description, as per requirement 3. it creates a character vector of activity names, as provided in activity_labels.txt. It uses the mutate command to replace the number with the name using the number as index of the vector. 


```
# 3. Use descriptive activity names to name the activities in the data set
# load the activity labels
act_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[[2]]

# replace data with activity label
df_test_train <- mutate(df_test_train, Activity = act_labels[Activity])

#clean up environment
rm(act_labels)
```

Then it produces a summary, as per requirement 5, a tidy data set (wide form) showing an average for each variable for each subject and activity. The pipe (%>%) technique is used to prevent an extra data frame being created at each step. 

In order to calculate the means for each variable I make use of the pivot_longer command (which supersedes the gather commend as shown in the course). This is used to move the variables and values into the column and so the means can be calculated with one line, instead of one line per variable. 

Then the group_by command adds the required grouping: Subject, Activity, then Variable.

The summarise commend is used to produce the summary table, with the one values column which calculated the mean

Then pivot_wider is used to transform the data frame back into the long form of tidy data: one row per observation, that is to say each line contains one person/activity combination and each variable has been averaged using the mean function. 

Then this tidy data set is saved as "summary_table.txt, using the commands given in the assignment so it can be uploaded.

```
# 5. From the data set in step 4, create a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

df_summary <- df_test_train %>% 
        pivot_longer(cols = 3:81) %>% # pivot longer for one variable per row
        group_by(Subject, Activity, name) %>% # add  grouping 
        summarise(mean = mean(value)) %>% # summarise and calculate mean 
        pivot_wider(names_from = name, values_from = mean) #back to wide data

# save out summary DF
write.table(df_summary, file = "summary_table.txt", row.names = FALSE)
```

Once run this file creates two data frames in the users environment:

df_test_train - a tidy data set resultant from the merge of tt and train data
df_summary -  a tidy data set summarising the mean per subject/activity 

The following file is saved to the user's working directory

summary_table.txt - saved file that can be submitted for the assignment


This shows that the run_analysis.R file meets all the requirements for the assignment.

