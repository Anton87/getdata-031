This code book includes:

- information on the original data set
- information on the variables in the original data set
- information on the variables in the tidy data set

### Description of the *original* [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) ([source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones))
This data set contains data collected from the accelerometers from Samsung Galaxy S smartphone. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


###Description of the features in the *original* [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

###Description of the features in the [Tidy dataset](https://github.com/Anton87/getdata-031/blob/master/data/UCI%20HAR%20Dataset/tidy.txt)

**subject**:
	An identifier of th subject  who carride out the experiment 

**tBodyAcc-mean()-X**:
	Mean of the exstimated body acceleration on the X axis
 
**tBodyAcc-mean()-Y**:
	Mean of the estimated body acceleration on the Y axis
	
**tBodyAcc-mean()-Z**:
	Mean of the body acceleration on the Z axis

**tBodyAcc-std()-X**:
	Standard deviation of the body acceleration on the X axis

**tBodyAcc-std()-Y**:
	Standard deviation of the body acceleration on the Y axis

**tBodyAcc-std()-Z**:
	Standard deviation of the body acceleration on the Z axis

**tGravityAcc-mean()-X**:
	Mean of the gravity acceleration on the X axis

**tGravityAcc-mean()-Y**:
	Mean of the gravity acceleration on the Y axix

**tGravityAcc-mean()-Z**:
	Mean of the gravity acceleration on the Z axis.

**tBodyAccJerk-mean()-X**:
	Mean of the jerk body acceleration on the X axis.

**tBodyAccJerk-mean()-Y**:
	Mean of the jerk body acceleration on the Y axis.

**tBodyAccJerk-mean()-Z**:
	Mean of the jerk body acceleration on the Z axis.

**tBodyAccJerk-std()-X**:
	Standard deviation of the jerk body acceleration on the X axis.

**tBodyAccJerk-std()-Y**:
	Standard deviation of the jerk body acceleration on the Y axis.

**tBodyAccJerk-std()-Z**:
	Standard deviation of the jerk body acceleration on the Z axis.

**tBodyGyro-mean()-X**:
	Mean of the angular velocity on the X axis.

**tBodyGyro-mean()-Y**:
	Mean of the angular velocity on the Y axis.

**tBodyGyro-mean()-Z**:
	Mean of the angular velocity on the Z axis.

**tBodyGyro-std()-X**:
	Standard deviation of the angular velocity on the X axis.

**tBodyGyro-std()-Y**:
	Standard deviation of the angular velocity on the Y axis.

**tBodyGyro-std()-Z**:
	Standard deviation of the angular velocity on the Z axis.

**tBodyGyroJerk-mean()-X**:
	Mean of the jerk angular velocity on the X axis.

**tBodyGyroJerk-mean()-Y**:
	Mean of the jerk angular velocity on the Y axis.

**tBodyGyroJerk-mean()-Z**:
	Mean of the jerk angular velocity on the Z axis.

**tBodyGyroJerk-std()-X**:
	Standard deviation of the jerk angular velocity on the X axis.
	
**tBodyGyroJerk-std()-Y**:
	Standard deviation of the jerk angular velocity on the Y axis.
	
**tBodyGyroJerk-std()-Z**:
	Standard deviation of the jerk angular velocity on the Z axis.
	
**tBodyAccMag-mean()**:
	Mean of the mean of the body acceleration .
                  
**tBodyAccMag-std()**:
	Magnitude of the body acceleration standard deviation.

**tGravityAccMag-mean()**:
	Magnitude of the body acceleration mean.

**tGravityAccMag-std()**:
	Magnitude of the gravity acceleration standard deviation.

**tBodyAccJerkMag-mean()**:
	Magnitude of the jerk body acceleration mean.

**tBodyAccJerkMag-std()**:
	Magnitude of the jerk body acceleration standard deviation.

**tBodyGyroMag-mean()**:
	Mean of the magnitude of the angular acceleration.

**tBodyGyroMag-std()**:
	Standard deviation of the magnitude of the angular acceleration.

**tBodyGyroJerkMag-mean()**:
	Mean of the magnitude of the jerk angular acceleration.

**tBodyGyroJerkMag-std()**:
	Standard deviation of the magnitude of the jerk angular acceleration.

**fBodyAcc-mean()-X**:
	Mean of the frequency domain signal of the body acceleration on the X axis.

**fBodyAcc-mean()-Y**:
	Mean of the frequency domain signal of the body acceleration on the Y axis.

**fBodyAcc-mean()-Z**:
	Mean of the frequency domain signal of the body acceleration on the Z axis.
	
**fBodyAcc-std()-X**:
	Standard deviation of the frequency domain signal of the body acceleration on the X axis.

**fBodyAcc-std()-Y**:
	Standard deviation of the frequency domain signal of the body acceleration on the Y axis.

**fBodyAcc-std()-Z**:
	Standard deviation of the frequency domain signal of the body acceleration on the Z axis.

**fBodyAcc-meanFreq()-X**:
	Mean frequency of the body acceleration on the X axis.
 
**fBodyAcc-meanFreq()-Y**:
	Mean frequency of the body acceleration on the Y axis.

**fBodyAcc-meanFreq()-Z**:
	Mean frequency of the body acceleration on the Z axis.

**fBodyAccJerk-mean()-X**:
	Mean of the frequency domain signal of the jerk body acceleration on the X axis.

**fBodyAccJerk-mean()-Y**:
	Mean of the frequency domain signal of the jerk body acceleration on the Y axis.

**fBodyAccJerk-mean()-Z**:
	Mean of the frequency domain signal of the jerk body acceleration on the Z axis.

**fBodyAccJerk-std()-X**:
	Standard deviation of the frequency domain signal of the jerk body acceleration on the X axis.

**fBodyAccJerk-std()-Y**:
	Standard deviation of the frequency domain signal of the jerk body acceleration on the Y axis.

**fBodyAccJerk-std()-Z**:
	Standard deviation of the frequency domain signal of the jerk body acceleration on the Z axis.

**fBodyAccJerk-meanFreq()-X**:
	Mean frequency of the jerk body acceleration on the X axis.

**fBodyAccJerk-meanFreq()-Y**:
	Mean frequency of the jerk body acceleration on the Y axis.

**fBodyAccJerk-meanFreq()-Z**:
	Mean frequency of the jerk body acceleration on the Z axis.

**fBodyGyro-mean()-X**:
	Mean of the frequency domain signal of the angular velocity on the X axis.

**fBodyGyro-mean()-Y**:
	Mean of the frequency domain signal of the angular velocity on the Y axis.

**fBodyGyro-mean()-Z**:
	Mean of the frequency domain signal of the angular velocity on the Z axis.

**fBodyGyro-std()-X**:
	Standard deviation of the frequency domain signal of the angular velocity on the X axis.

**fBodyGyro-std()-Y**:
	Standard deviation of the frequency domain signal of the angular velocity on the X axis.

**fBodyGyro-std()-Z**:
	Standard deviation of the frequency domain signal of the angular velocity on the Z axis.

**fBodyGyro-meanFreq()-X**:
	Mean frequency of the angular velocity on the Z axis.

**fBodyGyro-meanFreq()-Y**:
	Mean frequency of the angular velocity on the Y axis.

**fBodyGyro-meanFreq()-Z**:
	Mean frequency of the angular velocity on the Z axis.

**fBodyAccMag-mean()**:
	Mean of the magnitude of frequency domain signal of the body acceleration.

**fBodyAccMag-std()**:
	Standard deviation of the magnitude of frequency domain signal of the body acceleration.

**fBodyAccMag-meanFreq()**:
	Mean frequency of the magnitude of the body acceleration.

**fBodyBodyAccJerkMag-mean()**:
	Not enough info to understand the meaning of this variable.

**fBodyBodyAccJerkMag-std()**: 
	Not enough info to understand the meaning of this variable.

**fBodyBodyAccJerkMag-meanFreq()**:
	Not enough info to understand the meaning of this variable.

**fBodyBodyGyroMag-mean()**:
	Not enough info to understand the meaning of this variable.

**fBodyBodyGyroMag-std()**:
	Not enough info to understand the meaning of this variable.

**fBodyBodyGyroMag-meanFreq()**:
	Not enough info to understand the meaning of this variable.

**fBodyBodyGyroJerkMag-mean()**:
	Not enough info to understand the meaning of this vaariable.

**fBodyBodyGyroJerkMag-std()**:
	Not enough info to understand the meaning of this variable.

**fBodyBodyGyroJerkMag-meanFreq()**:
	Not enough info to understand the meaning of this variable.s

**angle(tBodyAccMean,gravity)**:
	Angle between the body acceleration mean vector and gravity vector.

**angle(tBodyAccJerkMean),gravityMean)**:
	Angle between the jerk body acceleration mean vector and gravity mean vector.

**angle(tBodyGyroMean,gravityMean)**:
	Angle between the angular jerk angular velocity mean vector and the gravity mean vector.

**angle(tBodyGyroJerkMean,gravityMean)**:
	Angle between the jerk body acceleration mean vector and the gravity vector.

**angle(X,gravityMean)**:
	Angle between the X vector and the gravity mean vector.

**angle(Y,gravityMean)**:
	Angle between the Y vector and the gravity mean vector.

**angle(Z,gravityMean)**:
	Angle between the Z vector and the gravity mean vector.

**activity**:
	The activity label (e.g. WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

