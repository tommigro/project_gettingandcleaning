# Codebook for Coursera Getting and Cleaning Data Course Projekt: Tidy Dataset

## Data Source

The data sets used for this project are available under this download link: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data sets published have been collected via waist-mounted smartphones with embedded inertial sensors. 
The goal was to analyse and to learn about human activities.

The data sets are distributed over several folders:

### UCI HAR Dataset
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
   
## Features (signals) within dataset (copied from features_info.txt)
   
These features are used as columns names for both, the test as well as the train data (X_test, X_train) 
   
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

From these variables only the those of mean and std are kept for the tidy data set.

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

## Activities (copied from activity_labels.txt)

This list can be used as lookup table for joining activity labels to the data.

* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING

