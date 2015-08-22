# getdata-031 - Course Project

## Author

Antonio Uva


## Introduction


## Code Walkthrough
The run_analysis.R script creates a tidy version of the data set that can be download at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

This is accoomplished thorugh the following steps:

0. Download and unzip the data required to run the project.
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Label the data set with descriptive variable names. 
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.


### Prerequisites  
The code requires to load the reshape2 library.


### 1. Downloading and unzipping of the data 

The following code creates a directory named data, download the zipped data and then unzip the archive in the data dir.

```
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

```

1. Merge the training and the test sets to create one data set.

The function read.tables load a dataset split across different files.

The code use the function read.tables to load the train and test dataset.

The train and test dataset are then merged.

```
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
```




