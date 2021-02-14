# run_analysis file created for the Getting and Cleaning Data course project
# assumes data in a folder called "UCI HAR Dataset" in the current working
# directory

# the Review criteria, are numbered and included as comments in this code 
# before the steps that fulfill them

#load required packages
library(dplyr) # for the mutate, group_by and summarise commands
library(tidyr) # for pivot_longer and pivot_wider commands


# 1. Merge the training and the test sets to create one data set.
# and
# 4. Appropriately label the data set with descriptive variable names. 

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


# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement.
df_test_train <- df_test_train[,grep("Subject|Activity|[mM]ean|std", 
                                     names(df_test_train))]

# 3. Use descriptive activity names to name the activities in the data set
# load the activity labels
act_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[[2]]

# replace data with activity label
df_test_train <- mutate(df_test_train, Activity = act_labels[Activity])

#clean up environment
rm(act_labels)


# 5. From the data set in step 4, create a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

df_summary <- df_test_train %>% 
        pivot_longer(cols = 3:81) %>% # pivot longer for one variable per row
        group_by(Subject, Activity, name) %>% # add  grouping 
        summarise(mean = mean(value)) %>% # summarise and calculate mean 
        pivot_wider(names_from = name, values_from = mean) #back to wide data

# save out summary DF
write.table(df_summary, file = "summary_table.txt", row.names = FALSE)


# documentation

# make codebook

# make readme
