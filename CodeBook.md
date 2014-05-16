
# Getting and Cleaning Data - Course Project - Code Book

This file describes all the variables from the tidy dataset, the data, and any transformations or work performed to clean up the data.


## Transformations


### run_analysis.R

All the transformations are completely scripted in run_analysis.R
This script assumes that you have downloaded the data using the download_data.R; if you downloaded the data manually, please read the README.md file to see the expected location/form of the data.

Steps:

1. Read the activity names and ids from activity_labels.txt

2. Read the measure names, removing the brackets from the names  

3. read and merge data for the test dataset using the merge_dataset (see below)
4. read and merge data for the train dataset using the merge_dataset (see below)

5. merge the test and train datasets together

6. average of each numerical variable for each activity and subject (ignoring NAs)

7. order the final set and save it to file "UCI-HAR.summary.txt"
 

### merge_dataset.R

In order to make it easy to follow each individual step, the script will first transform each set and then merge the data only at the end.
Each individual set (either test or train) is first processed in merge_dataset (merge_dataset.R)

1. Read the main data set (with the measurements - X_&lt;set>.txt - where &lt;set> is either "test" or "train") and set the column names with the "features" from the features.txt - first row in features.txt as column name for the first column in X_&lt;set>.txt, second row as name for the second column and so on

2. Read the subjects (from subject_train.txt)

3. Read the activity id (from y_train.txt) and replace the IDs with the activity name

4. select only the columns containing "mean" or "std" in the main set (from point 1. above)

5. merge all 3 sets together, "row by row" (using cbind)


## Variable Names

For convenience the names of the measures were not renamed, but kept the same like in the original data source.

Basically they are built on the following pattern:

&lt;type>&lt;acceleration-type>&lt;source>[Jerk][Mag]&lt;axis>

where:
- &lt;type> is:
  - t - time (original) signal
  - f - frequency domain signal (a Fast Fourier Transform (FFT) was applied)
- &lt;acceleration-type>
  - Body - body acceleration signals 
  - Gravity - gravity acceleration signals
- &lt;Source> is
  - Acc - accelerometer
  - Gyro - gyroscope
- [Jerk] - (optional) indicates that the body linear acceleration and angular velocity were derived in time to obtain Jerk signals
- [Mag] - (optional) indicates that the magnitude of the three-dimensional signals was calculated using the Euclidean norm 
- &lt;axis> - the three dimensional axis on which the measurement was done (X, Y or Z directions)

e.g. tBodyAccJerk-mean-X is the mean (mean) of the time (t) body (body) acceleration (Acc) signals measured by the accelerometer on the X-axis (X), derived in time to obtain Jerk (Jerk) signals and averaged.

See README.md, section Data Collection / The Experiment.


## Variable Description

### subject
The - the subject who performed the activity for each window sample. In the mearged data set it ranges from 1 to 30 and it is sourced from subject_train.txt and subject_test.txt and merged as described above. 

### activity
The activity the subject was performing when the measurements were done as factor: 
* WALKING [1]
* WALKING_UPSTAIRS [2]
* WALKING_DOWNSTAIRS [3]
* SITTING [4]
* STANDING [5]
* LAYING [6]

It is sourced from y_train.txt and y_test.txt and merged as described above.


### Measures of the raw signals that came from the accelerometer and gyroscope 


### tBodyAcc-mean-X
The mean of the time body acceleration signals measured by the accelerometer on the X-axis.  

### tBodyAcc-mean-Y
Same as abvoe, but on the Y-axis.

### tBodyAcc-mean-Z
Same as abvoe, but on the Z-axis.

### tGravityAcc-mean-X
The mean of the time gravity acceleration signals measured by the accelerometer on the X-axis.  

### tGravityAcc-mean-Y
Same as abvoe, but on the Y-axis.

### tGravityAcc-mean-Z
Same as abvoe, but on the Z-axis.

### tBodyAccJerk-mean-X
The time body acceleration signals measured by the accelerometer on the X-axis, derived in time to obtain Jerk signals and averaged.  

### tBodyAccJerk-mean-Y
Same as abvoe, but on the Y-axis.

### tBodyAccJerk-mean-Z
Same as abvoe, but on the Z-axis.

### tBodyGyro-mean-X
The mean of the time body acceleration signals measured by the gyroscope on the X-axis.

### tBodyGyro-mean-Y
Same as abvoe, but on the Y-axis.

### tBodyGyro-mean-Z
Same as abvoe, but on the Z-axis.

### tBodyGyroJerk-mean-X
The time body acceleration signals measured by the gyroscope on the X-axis, derived in time to obtain Jerk signals and averaged.  

### tBodyGyroJerk-mean-Y
Same as abvoe, but on the Y-axis.

### tBodyGyroJerk-mean-Z
Same as abvoe, but on the Z-axis.

### tBodyAccMag-mean
The magnitude of the time body acceleration signals measured by the accelerometer on the X-axis signals that were calculated using the Euclidean norm. 
 
### tGravityAccMag-mean
The magnitude of the time gravity acceleration signals measured by the accelerometer on the X-axis signals that were calculated using the Euclidean norm. 
 
### tBodyAccJerkMag-mean
The magnitude of the time body acceleration signals measured by the accelerometer on the X-axis signals, derived in time to obtain Jerk signals then calculated using the Euclidean norm. 
 
### tBodyGyroMag-mean
The magnitude of the time gravity acceleration signals measured by the gyrometer on the X-axis signals that were calculated using the Euclidean norm. 
 
### tBodyGyroJerkMag-mean
The magnitude of the time body acceleration signals measured by the gyrometer on the X-axis signals, derived in time to obtain Jerk signals then calculated using the Euclidean norm. 
 

### Measures of the raw signals that came from the accelerometer and gyroscope after a Fast Fourier Transform (FFT) was applied to them 


### fBodyAcc-mean-X
The results of the Fast Fourier Transformation (FFT) that was applied to the time body acceleration signals measured by the accelerometer on the X-axis.

### fBodyAcc-mean-Y
Same as abvoe, but on the Y-axis.

### fBodyAcc-mean-Z
Same as abvoe, but on the Z-axis.

### fBodyAcc-meanFreq-X
The results of the Fast Fourier Transformation (FFT) that was applied to the time body acceleration frequencies measured by the accelerometer on the X-axis).

### fBodyAcc-meanFreq-Y
Same as abvoe, but on the Y-axis.

### fBodyAcc-meanFreq-Z
Same as abvoe, but on the Z-axis.

### fBodyAccJerk-mean-X
The time body acceleration signals measured by the accelerometer on the X-axis, derived in time to obtain Jerk signals and averaged, then applying the Fast Fourier Transformation.

### fBodyAccJerk-mean-Y
Same as abvoe, but on the Y-axis.

### fBodyAccJerk-mean-Z
Same as abvoe, but on the Z-axis.

### fBodyAccJerk-meanFreq-X
The time body acceleration frequencies measured by the accelerometer on the X-axis, derived in time to obtain Jerk signals and averaged, then applying the Fast Fourier Transformation.

### fBodyAccJerk-meanFreq-Y
Same as abvoe, but on the Y-axis.

### fBodyAccJerk-meanFreq-Z
Same as abvoe, but on the Z-axis.

### fBodyGyro-mean-X
The results of the Fast Fourier Transformation (FFT) that was applied to the time body acceleration signals measured by the gyroscope on the X-axis).

### fBodyGyro-mean-Y
Same as abvoe, but on the Y-axis.

### fBodyGyro-mean-Z
Same as abvoe, but on the Z-axis.

### fBodyGyro-meanFreq-X
The results of the Fast Fourier Transformation (FFT) that was applied to the time body acceleration frequencies measured by the gyroscope on the X-axis).

### fBodyGyro-meanFreq-Y
Same as abvoe, but on the Y-axis.

### fBodyGyro-meanFreq-Z
Same as abvoe, but on the Z-axis.

### fBodyAccMag-mean
The avearage of the Fast Fourier Transformation (FFT) that was applied to the time body acceleration signals measured by the accelerometer on all the three axis).

### fBodyAccMag-meanFreq
The avearage of the Fast Fourier Transformation (FFT) that was applied to the time body acceleration frequencies measured by the accelerometer on all the three axis).

### fBodyBodyAccJerkMag-mean
The avearage of the Fast Fourier Transformation (FFT) that was applied to the time body acceleration signals measured by the accelerometer on all the three axis) and derived in time to obtain Jerk signals.

### fBodyBodyAccJerkMag-meanFreq
The avearage of the Fast Fourier Transformation (FFT) that was applied to the time body acceleration frequencies measured by the accelerometer on all the three axis) and derived in time to obtain Jerk signals.

### fBodyBodyGyroMag-mean
The avearage of the Fast Fourier Transformation (FFT) that was applied to the time body acceleration signals measured by the gyrometer on all the three axis).

### fBodyBodyGyroMag-meanFreq
The avearage of the Fast Fourier Transformation (FFT) that was applied to the time body acceleration frequencies measured by the gyrometer on all the three axis).

### fBodyBodyGyroJerkMag-mean
The avearage of the Fast Fourier Transformation (FFT) that was applied to the time body acceleration signals measured by the gyrometer on all the three axis) and derived in time to obtain Jerk signals.

### fBodyBodyGyroJerkMag-meanFreq
The avearage of the Fast Fourier Transformation (FFT) that was applied to the time body acceleration frequencies measured by the gyrometer on all the three axis) and derived in time to obtain Jerk signals.

And the last seven columns are the angle() variable - the additional measures obtained by averaging the signals in a signal window sample:

### angle_tBodyAccMean_gravity
Calculated as angle(tBodyAccMean, gravity)

### angle_tBodyAccJerkMean_gravityMea
Calculated as angle(tBodyAccJerkMean, gravityMean)

### angle_tBodyGyroMean_gravityMean
Calculated as angle(tBodyGyroMean, gravityMean)

### angle_tBodyGyroJerkMean_gravityMean
Calculated as angle(tBodyGyroJerkMean, gravityMean)

### angle_X_gravityMean
Calculated as angle(X, gravityMean)

### angle_Y_gravityMean
Calculated as angle(Y, gravityMean)

### angle_Z_gravityMean
Calculated as angle(Z, gravityMean)

