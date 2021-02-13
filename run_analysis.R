# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

library(dplyr)


# 1. merge the data sets

# load both data sets
# establish common variable name
# do the merge
# 2 sets constructed the same way.... common method should work for both
# do test as its the smaller one


#get variable names, common to both test and train 
df_col_names <- read.table("./data/features.txt")
col_names <- df_col_names[[2]]

#load test data
df_test <- read.table("./data/test/X_test.txt")
names(df_test) <- col_names

#load test subject data
sub_test <- read.table("./data/test/subject_test.txt")
names(sub_test) <- c("Subject")

#combined 
df_test_com <- cbind(sub_test, df_test)

#load train data
df_train <- read.table("./data/train/X_train.txt")
names(df_train) <- col_names

#load train subject data
sub_train <- read.table("./data/train/subject_train.txt")
names(sub_train) <- c("Subject")

#combined 
df_train_com <- cbind(sub_train, df_train)

#combine test and train data
df_test_train <- rbind(df_test_com, df_train_com)

#clean up environment
rm(col_names, df_col_names, df_test, df_test_com,
   df_train, df_train_com, sub_test, sub_train)


# 2. extract mean and std dev for each measurement


# 3. change activity name to something descriptive


# 4. use descriptive variable names


# 5. from data in step 4, create new data set ave for each act and each subject
