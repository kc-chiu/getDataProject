# Code Book

## Getting and Cleaning Data Project 2014 April

#### Data Source
#### Human Activity Recognition Using Smartphones Dataset Version 1.0
* URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Date/Time of Download: 2014-04-23 6:30 UTC

#### The following Study Design and Code Book sections were compiled by copying from the files (README.txt and features_info.txt) included in the downloaded dataset. For full details, please refer to those files or visit the web site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Study Design

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

#### For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

#### Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

## Code Book

The data clean up started from the X\_train.txt and X\_test.txt files. These two files consolidated the raw data files in Inertial Signals folders.

Data Group (test or train), subjects (the 30 persons participating in the experiment), activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) were added to the X\_ files. Feature (measurement) names were added to the column headers in X\_ files.

The X_train.txt and X_test.txt files were merged together. Then record rows are extracted with columns of mean and standard deviation readings. 
##### Output file: run_analysis_output1.txt

The file was then further processed into a dataset with average of each variable for each activity and each subject.
##### Output file: run_analysis_output2.txt  

#### Variables in the two output files above
##### dataGroup  
>The dataset was randomly partitioned into 70% training data and 30% test data  
- test  
- train

##### subject  
>30 persons participated in the experiment  
- 1 to 30                            

##### activity   
>Each subject performed 6 activities for measurement  
- WALKING  
- WALKING\_UPSTAIRS  
- WALKING\_DOWNSTAIRS  
- SITTING  
- STANDING  
- LAYING                            

*The followings are the mean and standard deviation measurement variables.  
Explanation for these variables are at the end of this file.*  
##### tBodyAcc-mean()-X  
##### tBodyAcc-mean()-Y                   
##### tBodyAcc-mean()-Z                   
##### tBodyAcc-std()-X                    
##### tBodyAcc-std()-Y                    
##### tBodyAcc-std()-Z                    
##### tGravityAcc-mean()-X                
##### tGravityAcc-mean()-Y                
##### tGravityAcc-mean()-Z                
##### tGravityAcc-std()-X                 
##### tGravityAcc-std()-Y                 
##### tGravityAcc-std()-Z                 
##### tBodyAccJerk-mean()-X               
##### tBodyAccJerk-mean()-Y               
##### tBodyAccJerk-mean()-Z               
##### tBodyAccJerk-std()-X                
##### tBodyAccJerk-std()-Y                
##### tBodyAccJerk-std()-Z                
##### tBodyGyro-mean()-X                  
##### tBodyGyro-mean()-Y                  
##### tBodyGyro-mean()-Z                  
##### tBodyGyro-std()-X                   
##### tBodyGyro-std()-Y                   
##### tBodyGyro-std()-Z                   
##### tBodyGyroJerk-mean()-X              
##### tBodyGyroJerk-mean()-Y              
##### tBodyGyroJerk-mean()-Z              
##### tBodyGyroJerk-std()-X               
##### tBodyGyroJerk-std()-Y               
##### tBodyGyroJerk-std()-Z               
##### tBodyAccMag-mean()                  
##### tBodyAccMag-std()                   
##### tGravityAccMag-mean()               
##### tGravityAccMag-std()                
##### tBodyAccJerkMag-mean()              
##### tBodyAccJerkMag-std()               
##### tBodyGyroMag-mean()                 
##### tBodyGyroMag-std()                  
##### tBodyGyroJerkMag-mean()             
##### tBodyGyroJerkMag-std()              
##### fBodyAcc-mean()-X                   
##### fBodyAcc-mean()-Y                   
##### fBodyAcc-mean()-Z                   
##### fBodyAcc-std()-X                    
##### fBodyAcc-std()-Y                    
##### fBodyAcc-std()-Z                    
##### fBodyAcc-meanFreq()-X               
##### fBodyAcc-meanFreq()-Y               
##### fBodyAcc-meanFreq()-Z               
##### fBodyAccJerk-mean()-X               
##### fBodyAccJerk-mean()-Y               
##### fBodyAccJerk-mean()-Z               
##### fBodyAccJerk-std()-X                
##### fBodyAccJerk-std()-Y                
##### fBodyAccJerk-std()-Z                
##### fBodyAccJerk-meanFreq()-X           
##### fBodyAccJerk-meanFreq()-Y           
##### fBodyAccJerk-meanFreq()-Z           
##### fBodyGyro-mean()-X                  
##### fBodyGyro-mean()-Y                  
##### fBodyGyro-mean()-Z                  
##### fBodyGyro-std()-X                   
##### fBodyGyro-std()-Y                   
##### fBodyGyro-std()-Z                   
##### fBodyGyro-meanFreq()-X              
##### fBodyGyro-meanFreq()-Y              
##### fBodyGyro-meanFreq()-Z              
##### fBodyAccMag-mean()                  
##### fBodyAccMag-std()                   
##### fBodyAccMag-meanFreq()              
##### fBodyBodyAccJerkMag-mean()          
##### fBodyBodyAccJerkMag-std()           
##### fBodyBodyAccJerkMag-meanFreq()      
##### fBodyBodyGyroMag-mean()             
##### fBodyBodyGyroMag-std()              
##### fBodyBodyGyroMag-meanFreq()         
##### fBodyBodyGyroJerkMag-mean()         
##### fBodyBodyGyroJerkMag-std()          
##### fBodyBodyGyroJerkMag-meanFreq()     
##### angle(tBodyAccMean,gravity) <- might have typo error in the downloaded dataset: gavityMean instead of gravity          
##### angle(tBodyAccJerkMean),gravityMean) <- might have typo error in the downloaded dataset: extra ")" in the middle          
##### angle(tBodyGyroMean,gravityMean)    
##### angle(tBodyGyroJerkMean,gravityMean)
##### angle(X,gravityMean)                
##### angle(Y,gravityMean)                
##### angle(Z,gravityMean) 

#### Explanation for the variables of measurement

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'