
# This script does the following: 

# 1. Merges the training and the test sets to create one data set. 
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set 
# 4. Appropriately labels the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

source('merge_dataset.R')

# read activity labels
activity_labels = read.table(file = "./UCI HAR Dataset/activity_labels.txt", sep = " ", quote = "\"", fill = TRUE, comment.char = "", stringsAsFactors=FALSE)

names(activity_labels) <- c("id", "activity")
#activity_labels$activity <- factor(activity_labels$activity, ordered = TRUE)

# read features
features = read.table(file = "./UCI HAR Dataset/features.txt", sep = " ", quote = "\"", fill = TRUE, comment.char = "", stringsAsFactors=FALSE)
features <- features$V2

# remove the brackets from the names
features <- gsub("[()]", "", features)

# read and merge data for the test dataset
test <- merge_dataset(activity_labels, features, "test")

# read and merge data for the train dataset
train <- merge_dataset(activity_labels, features, "train")


# merge the test and train datasets and write them to a csv file
write.csv(rbind(test, train), file = "UCI-HAR.tidy.csv")

