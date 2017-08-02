# Codebook for Coursera Getting and Cleaning Data Course Projekt: Tidy Dataset

## Data Source

The data sets used for this project is available under this download link: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data sets published have been collected via waist-mounted smartphones with embedded inertial sensors. 
The goal was to analyse and to learn about human activities.

The data sets are distributed over several files:

UCI HAR Dataset
  * activity_labels.txt (Information about the 6 used activities - used as clear names for the different activities within the later tidy data)
  * features.txt (the different variables that have been calculated - used as column names within the later tidy data)
    * test (folder with records concerning the test subjects)
      * subject_test.txt (the subject codes corresponding to every line of data within X_test.txt)
      * y_test.txt (the codes for activities corresponding to every line of data within X_test.txt)
      * X_test.txt (the collected values for the different features)
    * train (folder with records concerning train subjects)
      * subject_train.txt (see test data above)
      * y_train.txt (see test data above)
      * X_train.txt (see test data above)
      
## Data Preparation 

The projects goal was to merge test and training data into one data set, to add a subject and activity column (using clear activity names) and name the many columns within the data sets.

This was achieved as followed:

1. load "meta data": features and activity labels: the latter could be used as a lookup table for getting all clear activity names. "Features" contain the column names for the dataset. As a first temporary result, a new dataframe for the test data was created by appending subject codes, activity and the test data set.
2. the same procedure was repeated for the training data
3. both temporary data frames have been appended using rbind.
4. in order to select only the mean and std features within the data set, a match-function was chosen within the selection in order to select columns that contain text like "mean" and "std". 
5. at the end this subselected data set was grouped by activity and subject and thereafter mean was calculated via summarize_all
6. write.table was used to write the resulting data frame into a tidy data text file.
