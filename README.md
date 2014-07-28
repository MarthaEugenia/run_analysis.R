run_analysis.R
==============
 
-- 1. Merges the training and the test sets to create one data set.

Reading the data for training set

Merging the data for training set

Reading the data for test set

Merging the data for test set

Merging the training and test sets

-- 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

Looks for mean and standard deviation from features

-- 3. Uses descriptive activity names to name the activities in the data set

By looking at the activity_id a new column is added to state what the id meant (1 for WALKING, etc.)

-- 4. Appropriately labels the data set with descriptive variable names. 

Change some variables names, changing  "." to "_"

-- 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Finds the mean for each activity id and each subject id to create the final tidy data


Source for data:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

