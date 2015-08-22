###############################################################################################
#                                                                                             #
#                                      0. Prepare data.                                       #
#                                                                                             #
###############################################################################################

url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# create data directory 
dir.create(file.path(".", "data"), showWarnings = FALSE)

# download project data
filename = "data/UCI_HAR_Dataset.zip"
if (!file.exists(filename)) {
    message("Downloading the data from: ", url, "...", appendLF = FALSE)
    download.file(url, filename)
    message("done.")
}

# unzip project data
if (!dir.exists("data/UCI HAR Dataset")) { 
    message("Unzipping the data in: data/UCI HAR Dataset... ", appendLF = FALSE)
    unzip(filename, exdir = "data")
    message("done.")
}


###############################################################################################
#                                                                                             #
#            1. Merges the training and the test sets to create one data set.                 #
#                                                                                             #
###############################################################################################

# read a list of tables and store it in a unique table.
read.tables <- function(...) {
    args <- list(...)
    data <- do.call(cbind, lapply(args, function(filename){read.table(filename)}))
    data
}

# read train set
message("Read train data from: data/UCI HAR Dataset/train... ", appendLF = FALSE)
train <- read.tables(
    "data/UCI HAR Dataset/train/subject_train.txt",
    "data/UCI HAR Dataset/train/X_train.txt",
    "data/UCI HAR Dataset/train/y_train.txt"
    )
message("done.")

# read test set
message("Read test data from: data/UCI HAR Dataset/test... ", appendLF = FALSE)
test <- read.tables(
    "data/UCI HAR Dataset/test/subject_test.txt",
    "data/UCI HAR Dataset/test/X_test.txt",
    "data/UCI HAR Dataset/test/y_test.txt"
    )
message("done.")

# merge train an test data
message("Merging train and test data... ", appendLF = FALSE)
data <- rbind(train, test)
message("done.")


###############################################################################################
#                                                                                             #
#              4. Appropriately labels the data set with descriptive variable names.          #
#                                                                                             #
###############################################################################################

# read feature names
features <- c(c("subject", as.vector(read.table("data/UCI HAR Dataset/features.txt")$V2)), "activity")

# set feature names
message("Labeling the data using descriptive names for the variables... ", appendLF = FALSE)
colnames(data) <- features
message("done.")


###############################################################################################
#                                                                                             #
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.  #
#                                                                                             #
###############################################################################################

message("Extracting only mean and std measurements... ", appendLF = FALSE)
# filter out coloumns that do not contain mean and standard deviation of each measurement.
myvars <- sapply(names(data), function(colname){colname %in% c("subject", "activity") || grepl("mean", tolower(colname)) || grepl("std", tolower(colname))}, USE.NAMES = FALSE)
newdata <- data[, myvars]
message("done.")


###############################################################################################
#                                                                                             #
#          3. Uses descriptive activity names to name the activities in the data set          #
#                                                                                             #
###############################################################################################

# 3. Uses descriptive activity names to name the activities in the data set

message("Labeling data using descriptive activity names... ", appendLF = FALSE)
# load activity labels
activity_labels <- as.vector(read.table("data/UCI HAR Dataset/activity_labels.txt")$V2)
# replace activiy with labels
newdata$activity <- sapply(newdata$activity, function(activity_id){activity_labels[activity_id]})
message("done.")


###############################################################################################
#                                                                                             #
#       5. From the data set in step 4, creates a second, independent tidy data set with      #
#                                                                                             #
#           the average of each variable for each activity and subject.                       #
#                                                                                             #
###############################################################################################


library(reshape2)

message("Building tidy set... ", appendLF = FALSE)
# melt dataset: use subject and activity as id vars
newdataMelt <- melt(newdata, id=c("subject", "activity"))
# recast dataset: break down variables by subject and activity
tidyData <- dcast(newdataMelt, subject + activity ~ variable, mean)
message("done.")

# write tidy file
message("Writing tidy file: data/UCI HAR Dataset/tidy.txt... ", appendLF = FALSE) 
write.csv(tidyData, "data/UCI HAR Dataset/tidy.txt", row.names = FALSE)
message("done.")
