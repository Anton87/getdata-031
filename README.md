# getdata-031 - Course Project

## Author

Antonio Uva


## Introduction
The aim of this project is to show how to collect, work with, and clean a data set.


## Code Walkthrough
The run_analysis.R script creates a tidy version of the data set that can be download at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

This data set contains data collected from accelerometers from Samsung Galaxy S Smartphone. More info about the data can be found here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This is accoomplished thorugh the following steps:

0. Download and unzip the data required to run the project.
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Label the data set with descriptive variable names. 
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.


You can read the tidy version of the data set created by this script by running:

```R
	tidy <- read.csv("data/UCI HAR Dataset/tidy.txt")

```

Please refer to the [code book](https://github.com/Anton87/getdata-031/blob/master/CodeBook.md) that describes the variables in the tidy data set.



### Prerequisites  
The code requires the reshape2 library; make sure it is installed.


### 1. Downloading and unzipping of the data 

The following code creates a directory named data, downloads the zipped project data and then unzips the archive in the data dir.

```R
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# create data directory 
dir.create(file.path(".", "data"), showWarnings = FALSE)

# download project data
filename = "data/UCI_HAR_Dataset.zip"
if (!file.exists(filename)) {
    download.file(url, filename)
}

# unzip project data
if (!dir.exists("data/UCI HAR Dataset")) { 
    unzip(filename, exdir = "data")
}

```


### 2. Merge the training and the test sets to create one data set

The function read.tables loads a dataset split across different files.

The code uses the function read.tables to load the train and test dataset.

The train and test dataset are then merged.

```R
# read train set
train <- read.tables(
    "data/UCI HAR Dataset/train/subject_train.txt",
    "data/UCI HAR Dataset/train/X_train.txt",
    "data/UCI HAR Dataset/train/y_train.txt"
    )

# read test set
test <- read.tables(
    "data/UCI HAR Dataset/test/subject_test.txt",
    "data/UCI HAR Dataset/test/X_test.txt",
    "data/UCI HAR Dataset/test/y_test.txt"
    )

# merge train an test data
data <- rbind(train, test)
```


### 3. Extract only the measurements on the mean and standard deviation for each measurement

The following code filters out the columns that do not contain the mean and standard deviation for each measurement by checking that column names contain the words "mean" and "std".

The subject and activity columns are also retained.

```R
# filter out coloumns that do not contain mean and standard deviation of each measurement.
myvars <- sapply(names(data), function(colname){colname %in% c("subject", "activity") || grepl("mean", tolower(colname)) || grepl("std", tolower(colname))}, USE.NAMES = FALSE)
newdata <- data[, myvars]
```


### 4. Use descriptive activity names to name the activities in the data set

This snippet replaces the activity ids in the dataset with descriptive activity names from the file activity_labels.txt.

```R
# load activity labels
activity_labels <- as.vector(read.table("data/UCI HAR Dataset/activity_labels.txt")$V2)
# replace activiy with labels
newdata$activity <- sapply(newdata$activity, function(activity_id){activity_labels[activity_id]})
```


### 5. Appropriately labels the data set with descriptive variable names.

This piece of code replaces the column names of the data set with descriptive variables names from file features.txt.

```R
features <- c(c("subject", as.vector(read.table("data/UCI HAR Dataset/features.txt")$V2)), "activity")

# set feature names
colnames(data) <- features
```

### 6. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

This last code creates a tidy version of the dataset by averaging the value of the variables by subject and activity type.

Then writes the code on the tidy.txt file.

```R
library(reshape2)

# melt dataset: use subject and activity as id vars
newdataMelt <- melt(newdata, id=c("subject", "activity"))
# recast dataset: break down variables by subject and activity
tidyData <- dcast(newdataMelt, subject + activity ~ variable, mean)

# write tidy file
write.csv(tidyData, "data/UCI HAR Dataset/tidy.txt", row.names = FALSE)
```
