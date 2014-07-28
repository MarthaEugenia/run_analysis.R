
# ------- 1. Merges the training and the test sets to create one data set.

# Reading the data for training set
features <- read.table("./UCI HAR Dataset/features.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",col.names=c("subject_id"))
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",col.names=features[,2])
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt",col.names=c("activity_id"))

# Merging the data for training set
training_set <- cbind(subject_train,Y_train, X_train)

# Reading the data for test set
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",col.names=c("subject_id"))
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",col.names=features[,2])
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt",col.names=c("activity_id"))

# Merging the data for test set
test_set <- cbind(subject_test,Y_test, X_test)

# Merging the training and test sets
tt_dataset <- rbind(training_set,test_set)

# ------- 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# Looks for mean and standard deviation from features
features_mean_std <- features[grepl("mean\\(\\)", features$V2) | grepl("std\\(\\)", features$V2), ]
# Keeps the first two columns (subject, Y) and the previously selected features
dataset_mean_std <- tt_dataset[,c(c(1,2),features_mean_std$V1+2)]

# ------- 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names=c("activity_id","activity_labels"))
dataset_mean_std <- merge(dataset_mean_std,activity_labels)

# ------- 4. Appropriately labels the data set with descriptive variable names. 

# Change some variables names, changing  "." to "_"
dataset_labels <- colnames(dataset_mean_std)
dataset_labels <- gsub("\\.std","_Std", dataset_labels)
dataset_labels <- gsub("\\.mean","_Mean", dataset_labels)
dataset_labels <- gsub("\\...","_", dataset_labels)
dataset_labels <- gsub("\\..","", dataset_labels)
colnames(dataset_mean_std) <- dataset_labels

# ------- 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

final_data <- dataset_mean_std[,c(-69)]
agg_data <-aggregate(final_data, by=list(subject = final_data$subject_id, activity = final_data$activity_id), FUN=mean, na.rm=TRUE)
agg_data <- agg_data[,c(-1,-2)]
final_data <- merge(agg_data, activity_labels)

write.csv(file="final_data.csv", x=final_data)
