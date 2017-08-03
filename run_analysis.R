library(dplyr)
library(data.table)
library(stringr)

# first get features and activity_labels

features <- fread("./UCI HAR Dataset/features.txt", header=F)
activity_labels <- fread("./UCI HAR Dataset/activity_labels.txt", header=F)
# set column names for dataframe activity_labels
names(activity_labels) <- c('activity_id', 'activity')

# read test data
# read subject_test.txt
subject_test <- fread("./UCI HAR Dataset/test/subject_test.txt", header=F)
# set name for column within df subject_test
names(subject_test)[1] <- 'subject'
# read y_test.txt 
y_test <- fread("./UCI HAR Dataset/test/y_test.txt", header=F)
# set name for column
names(y_test)[1] <- 'activity_id'
# use activity_labels for creating clearnames as values, join it with y_test
activity <- y_test %>% full_join(activity_labels, by = "activity_id") %>% select(activity)

# read x_test.txt
x_test <- fread("./UCI HAR Dataset/test/X_test.txt", header=F) 
# create a vector of features-data frame in order to use it for naming the columns
features_vector <- unlist(list(features$V2))
# use the features_vector for naming the columns 
colnames(x_test) <- features_vector

# training data temp result: bring columns subject, activity and x_test together
data_test_clean <- data.frame(subject_test, activity, x_test)

# then get training data
# read subject_train.txt
subject_train <- fread("./UCI HAR Dataset/train/subject_train.txt", header=F)
# set name for column within df subject_train
names(subject_train)[1] <- 'subject'
# read y_train.txt 
y_train <- fread("./UCI HAR Dataset/train/y_train.txt", header=F)
# set name for column
names(y_train)[1] <- 'activity_id'
# use activity_labels for creating clearnames as values
activity <- y_train %>% full_join(activity_labels, by = "activity_id") %>% select(activity)

# read x_train.txt
x_train <- fread("./UCI HAR Dataset/train/X_train.txt", header=F) 
# create a vector of features-data frame in order to use it for naming the columns
features_vector <- unlist(list(features$V2))
# use the features_vector for naming the columns 
colnames(x_train) <- features_vector

# training data temp result: bring columns subject, activity and x_test together
data_train_clean <- data.frame(subject_train, activity, x_train)

# rbind test- and train-data
data_complete <- rbind(data_test_clean, data_train_clean)
# select all columns that match mean and std
data_complete_selection <- data_complete %>% select(matches("sub|act|mean|std"))
#group by activity and subject, then summarize all fields using function mean
data_tidy <- data_complete_selection %>% group_by(activity, subject) %>% summarize_all(funs(mean))

write.table(data_tidy, file="tidy_data.txt", row.name = FALSE)
