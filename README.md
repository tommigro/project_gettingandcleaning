# project_gettingandcleaning

## Data cleaning and tidying process 

The projects goal was to merge test and training data into one data set, adding a subject and activity column (using clear activity names) and name the many columns within the data sets.

This was achieved by the following steps:

1. **loading data**: **features** and **activity labels**: activity labels file could be used as a lookup table for getting all activity labels (clear names). **features** contain the column names for the dataset. As a first temporary result, a new dataframe for the test data was created by appending subject codes, activity and the test data set.
2. step 1 was repeated for the training data
3. **merging data sets**: both temporary data frames have been appended using **rbind**.
4. **selection**: in order to select all **mean and std variables** within the data set, **function match** was chosen within the selection in order to select columns that contain text like "mean" and "std". 
5. **group and summarize**: finally this subselected data set was **grouped by activity and subject** and thereafter **mean was calculated via summarize_all**
6. **export to textfile**: function **write.table** was used to write the resulting data frame into the resulting tidy data text file **tidy_data.txt**.
