
#
# The script reads the activities (id and names) from activity_labels.txt,
# the list of measures (from features.txt).
#
# Then it reads both sets of data - the test and training set - from the 
# 3 corresponding files, merges them together and creates a second, 
# independent tidy data set with the average of each variable for each 
# activity and each subject.
#
# It also labels the data set with descriptive activity names
#

require("data.table")

source('merge_dataset.R')

# read activity labels
activity_labels = read.table(file = "./UCI HAR Dataset/activity_labels.txt"
                             , sep = " ", quote = "\"", fill = TRUE
                             , comment.char = "", stringsAsFactors=FALSE)

names(activity_labels) <- c("id", "activity")
#activity_labels$activity <- factor(activity_labels$activity, ordered = TRUE)

# read features
features = read.table(file = "./UCI HAR Dataset/features.txt"
                      , sep = " ", quote = "\"", fill = TRUE
                      , comment.char = "", stringsAsFactors=FALSE)
features <- features$V2

# remove the brackets from the names
features <- gsub("[()]", "", features)

# read and merge data for the test dataset
test <- merge_dataset(activity_labels, features, "test")

# read and merge data for the train dataset
train <- merge_dataset(activity_labels, features, "train")


# merge the test and train datasets and write them to a csv file
# write.csv(rbind(test, train), file = "UCI-HAR.tidy.csv")

# merge the test and train datasets
ucihar <- rbind(test, train)

# average of each variable for each activity and each subject
DT <-data.table(ucihar)

#DT[, mean(DT), by=c("subject", "activity")]
finalDT <- DT[, lapply(.SD, mean, na.rm=TRUE), by=c("subject", "activity")]

# order the final set and save it to file
write.csv(finalDT[order(finalDT$subject, finalDT$activity),], file = "UCI-HAR.summary.csv")

