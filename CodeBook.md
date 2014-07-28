Code Book

 ------- 1. Merges the training and the test sets to create one data set.

features 
2 variables: "feature_id", "feature_labels"
561 different labels

subject_train
1 variable: "subject_id" for the train set

X_train 
561 variables: specifications of movements, for 7352 observations

Y_train 
1 variable: "activity_id", identification of type of movement for the train set 

training_set 
merged the previously described variables (subject_train, X_train, Y_train)


subject_test 
1 variable: "subject_id" for the test set

X_test 
561 variables: specs of movs., for 2947 observations

Y_test 
1 variable: "activity_id", identification of type of movement for the test set 

test_set 
merged the previously described variables (subject_test, X_test, Y_test)


tt_dataset 
merged dataframe by row for the two sets mentioned above (test_set, training_set)

------- 2. Extracts only the measurements on the mean and standard deviation for each measurement. 


dataset_mean_std 
Dataframe containing only the features that contain "mean" and "std"


------- 3. Uses descriptive activity names to name the activities in the data set


activity_labels 
2 variables: "activity_id", "activity_labels" as follows
    1 WALKING
    2 WALKING_UPSTAIRS
    3 WALKING_DOWNSTAIRS
    4 SITTING
    5 STANDING
    6 LAYING



------- 4. Appropriately labels the data set with descriptive variable names. 

dataset_labels 
labels of the last dataframe containing only "mean" and "std", this variables is used to clean the variables names:

 [1] "activity_id"              
 [2] "subject_id"               
 [3] "tBodyAcc_Mean_X"          
 [4] "tBodyAcc_Mean_Y"          
 [5] "tBodyAcc_Mean_Z"          
 [6] "tBodyAcc_Std_X"           
 [7] "tBodyAcc_Std_Y"           
 [8] "tBodyAcc_Std_Z"           
 [9] "tGravityAcc_Mean_X"       
[10] "tGravityAcc_Mean_Y"       
[11] "tGravityAcc_Mean_Z"       
[12] "tGravityAcc_Std_X"        
[13] "tGravityAcc_Std_Y"        
[14] "tGravityAcc_Std_Z"        
[15] "tBodyAccJerk_Mean_X"      
[16] "tBodyAccJerk_Mean_Y"      
[17] "tBodyAccJerk_Mean_Z"      
[18] "tBodyAccJerk_Std_X"       
[19] "tBodyAccJerk_Std_Y"       
[20] "tBodyAccJerk_Std_Z"       
[21] "tBodyGyro_Mean_X"         
[22] "tBodyGyro_Mean_Y"         
[23] "tBodyGyro_Mean_Z"         
[24] "tBodyGyro_Std_X"          
[25] "tBodyGyro_Std_Y"          
[26] "tBodyGyro_Std_Z"          
[27] "tBodyGyroJerk_Mean_X"     
[28] "tBodyGyroJerk_Mean_Y"     
[29] "tBodyGyroJerk_Mean_Z"     
[30] "tBodyGyroJerk_Std_X"      
[31] "tBodyGyroJerk_Std_Y"      
[32] "tBodyGyroJerk_Std_Z"      
[33] "tBodyAccMag_Mean"         
[34] "tBodyAccMag_Std"          
[35] "tGravityAccMag_Mean"      
[36] "tGravityAccMag_Std"       
[37] "tBodyAccJerkMag_Mean"     
[38] "tBodyAccJerkMag_Std"      
[39] "tBodyGyroMag_Mean"        
[40] "tBodyGyroMag_Std"         
[41] "tBodyGyroJerkMag_Mean"    
[42] "tBodyGyroJerkMag_Std"     
[43] "fBodyAcc_Mean_X"          
[44] "fBodyAcc_Mean_Y"          
[45] "fBodyAcc_Mean_Z"          
[46] "fBodyAcc_Std_X"           
[47] "fBodyAcc_Std_Y"           
[48] "fBodyAcc_Std_Z"           
[49] "fBodyAccJerk_Mean_X"      
[50] "fBodyAccJerk_Mean_Y"      
[51] "fBodyAccJerk_Mean_Z"      
[52] "fBodyAccJerk_Std_X"       
[53] "fBodyAccJerk_Std_Y"       
[54] "fBodyAccJerk_Std_Z"       
[55] "fBodyGyro_Mean_X"         
[56] "fBodyGyro_Mean_Y"         
[57] "fBodyGyro_Mean_Z"         
[58] "fBodyGyro_Std_X"          
[59] "fBodyGyro_Std_Y"          
[60] "fBodyGyro_Std_Z"          
[61] "fBodyAccMag_Mean"         
[62] "fBodyAccMag_Std"          
[63] "fBodyBodyAccJerkMag_Mean" 
[64] "fBodyBodyAccJerkMag_Std"  
[65] "fBodyBodyGyroMag_Mean"    
[66] "fBodyBodyGyroMag_Std"     
[67] "fBodyBodyGyroJerkMag_Mean"
[68] "fBodyBodyGyroJerkMag_Std" 
[69] "activity_labels"  


------- 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
 

final_data 
dataframe without last column: "activity_labels"

agg_data 
dataframe rearranged to have the mean for each "activity_id" and each "subject_id"

final_data <- merge(agg_data, activity_labels)
dataframe that merges the last dataframe (agg_data) with the corresponing activity_labels.

