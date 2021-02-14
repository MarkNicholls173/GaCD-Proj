---
title: "CodeBook.md"
author: "Mark Nicholls"
date: "13/02/2021"
output: html_document
---


## CodeBook for Getting and Cleaning Data course project

This file copies from and updates the information provided in the text files which are included with the original data set. The information provided in the original data set is included after information related to the project data sets

Where a variable name includes XYZ this variable will be repeated for X, Y and Z in three separate variables

Firstly a combined data for test and train data, which is transformed into a tidy data set, includes the following variables:

- Subject: a number representing one person providing data
- Activity: description of the activity being undertaken for the measurements.
- tBodyAcc-XYZ: data for subject/activity taken from either test or train
- tGravityAcc-XYZ: data for subject/activity taken from either test or train
- tBodyAccJerk-XYZ: data for subject/activity taken from either test or train
- tBodyGyro-XYZ: data for subject/activity taken from either test or train
- tBodyGyroJerk-XYZ: data for subject/activity taken from either test or train
- tBodyAccMag: data for subject/activity taken from either test or train
- tGravityAccMag: data for subject/activity taken from either test or train
- tBodyAccJerkMag: data for subject/activity taken from either test or train
- tBodyGyroMag: data for subject/activity taken from either test or train
- tBodyGyroJerkMag: data for subject/activity taken from either test or train
- fBodyAcc-XYZ: data for subject/activity taken from either test or train
- fBodyAccJerk-XYZ: data for subject/activity taken from either test or train
- fBodyGyro-XYZ: data for subject/activity taken from either test or train
- fBodyAccMag: data for subject/activity taken from either test or train
- fBodyAccJerkMag: data for subject/activity taken from either test or train
- fBodyGyroMag: data for subject/activity taken from either test or train
- fBodyGyroJerkMag: data for subject/activity taken from either test or train
- gravityMean: data for subject/activity taken from either test or train
- tBodyAccMean: data for subject/activity taken from either test or train
- tBodyAccJerkMean: data for subject/activity taken from either test or train
- tBodyGyroMean: data for subject/activity taken from either test or train
- tBodyGyroJerkMean: data for subject/activity taken from either test or train


Secondly, a summary table which gives a mean average of all the measurements for every Subject/Activity combination

- Subject: a number representing one person providing data
- Activity: description of the activity being undertaken for the measurements.
- tBodyAcc-XYZ: mean of all values for this Subject/Activity
- tGravityAcc-XYZ: mean of all values for this Subject/Activity
- tBodyAccJerk-XYZ: mean of all values for this Subject/Activity
- tBodyGyro-XYZ: mean of all values for this Subject/Activity
- tBodyGyroJerk-XYZ: mean of all values for this Subject/Activity
- tBodyAccMag: mean of all values for this Subject/Activity
- tGravityAccMag: mean of all values for this Subject/Activity
- tBodyAccJerkMag: mean of all values for this Subject/Activity
- tBodyGyroMag: mean of all values for this Subject/Activity
- tBodyGyroJerkMag: mean of all values for this Subject/Activity
- fBodyAcc-XYZ: mean of all values for this Subject/Activity
- fBodyAccJerk-XYZ: mean of all values for this Subject/Activity
- fBodyGyro-XYZ: mean of all values for this Subject/Activity
- fBodyAccMag: mean of all values for this Subject/Activity
- fBodyAccJerkMag: mean of all values for this Subject/Activity
- fBodyGyroMag: mean of all values for this Subject/Activity
- fBodyGyroJerkMag: mean of all values for this Subject/Activity
- gravityMean: mean of all values for this Subject/Activity
- tBodyAccMean: mean of all values for this Subject/Activity
- tBodyAccJerkMean: mean of all values for this Subject/Activity
- tBodyGyroMean: mean of all values for this Subject/Activity
- tBodyGyroJerkMean: mean of all values for this Subject/Activity

This file fulfills the course requirement to provide a codebook for the project which details the variables in the data sets which are calculated, the units are in the original documentation below.



===============================================================================

### Feature Selection 

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
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each - window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

===============================================================================





