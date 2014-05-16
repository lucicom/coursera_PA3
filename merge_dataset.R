

merge_dataset <- function(activity_labels, features, set) {
    
    # read the specified subject dataset
    subject <- read.table(file = paste("./UCI HAR Dataset/", set, "/subject_", set, ".txt", sep = "")
                               , sep = " ", quote = "\"", fill = TRUE, comment.char = "", stringsAsFactors=FALSE)
    names(subject) <- "subject"
    
    # read the specified activity dataset
    y <- read.table(file = paste("./UCI HAR Dataset/", set, "/y_", set, ".txt", sep = "")
                    , sep = " ", quote = "\"", fill = TRUE, comment.char = "", stringsAsFactors=FALSE)
    y <- merge(y, activity_labels, by.x = "V1", by.y = "id")
    
    # read the main dataset
    X <- read.table(file = paste("./UCI HAR Dataset/", set, "/X_", set, ".txt", sep = "")
                    , header = FALSE, comment.char = "", stringsAsFactors=FALSE)
    names(X) <- features
    
    # select only the columns containing mean values
    X <- X[, grep(pattern = "mean", features ,ignore.case = TRUE)]
    
    # merge all 3 sets into one
    cbind(subject = subject, activity = y$activity, X)
}
