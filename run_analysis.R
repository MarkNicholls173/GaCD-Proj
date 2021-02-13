# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

library(dplyr)


# 1. merge the data sets

#get variable names, common to both test and train 
col_names <- read.table("./data/features.txt")[[2]]

#load test data
df_xtest <- read.table("./data/test/X_test.txt")
names(df_xtest) <- col_names

#load the test activity data
df_ytest <- read.table("./data/test/y_test.txt")
names(df_ytest) <- c("Activity")

#load test subject data
df_sub_test <- read.table("./data/test/subject_test.txt")
names(df_sub_test) <- c("Subject")

#combine the 3 
df_test_com <- cbind(df_sub_test, df_ytest, df_xtest)


#load train data
df_xtrain <- read.table("./data/train/X_train.txt")
names(df_xtrain) <- col_names

#load the train activity data
df_ytrain <- read.table("./data/train/y_train.txt")
names(df_ytrain) <- c("Activity")

#load train subject data
df_sub_train <- read.table("./data/train/subject_train.txt")
names(df_sub_train) <- c("Subject")

#combine the 3
df_train_com <- cbind(df_sub_train, df_ytrain, df_xtrain)

#combine test and train data
df_test_train <- rbind(df_test_com, df_train_com)

#clean up environment
rm(col_names, 
   df_xtest, df_ytest, df_test_com, df_sub_test, 
   df_xtrain, df_ytrain, df_train_com, df_sub_train)


# 2. extract mean and std for each measurement
df_test_train <- df_test_train[,grep("Subject|Activity|[mM]ean|std", 
                                     names(df_test_train))]

# 3. change activity name to something descriptive

# load the activity labels
act_labels <- read.table("./data/activity_labels.txt")[[2]]

# replace data with activity label
df_test_train <- mutate(df_test_train, Activity = act_labels[Activity])

#clean up environment
rm(act_labels)

# 4. use descriptive variable names - 
# variable names already added in step 1


# 5. from data in step 4, create new data set ave for each act and each subject

df_summary <- df_test_train %>% 
        pivot_longer(cols = 3:81) %>% # pivot longer for one variable per row
        group_by(Subject, Activity, name) %>% # add  grouping 
        summarise(mean = mean(value)) %>% # summarise and calculate mean 
        pivot_wider(names_from = name, values_from = mean) #back to wide data

# save out summary DF

# documentation

# make codebook

# make readme
