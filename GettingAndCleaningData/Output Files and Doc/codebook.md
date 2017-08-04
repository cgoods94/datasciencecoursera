# Getting And Cleaning Data - Course Project

### Connor Gooding - Coursera Data Science Specialization

## Code Book

### Raw Data Source

The raw data comes from experiments on Human Activity Recognition Using Smartphones conducted
at Università degli Studi di Genova in Genoa, Italy. UC Irvine's Web page for this dataset can
be found [here,](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
while the .zip file of said data can be found [here.](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip)

### Overview

The experiments that yielded this data involved 30 subjects (ages 19-48) performing six different activities
(WALKING on a level plane, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING down)
while wearing a Samsung Galaxy S II smartphone on the waist. The Samsung Galaxy S II smartphone has an
embedded accelerometer and gyroscope, making it able to capture 3-dimensional linear acceleration and angular
velocity. The signals from the accelerometer and gyroscope were also processed to yield variables in the time 
and frequency domains.

The first two variable names in the dataset, **subject** and **activity**, refer to the number ID
assigned to the subject performing the activity and said activity, respectively.

### Feature Variables - Format

The remaining variables are features of the smartphone's sensors. There are two forms for the descriptive feature
names in the tidy data set. Each variable name is a permutation of up to four descriptors:

1. **Domain:** whether the variable is in the time or frequency domain

	Possible values:
 	  * *time* - the time domain
 	  * *freq* - the frequency domain

2. **Measurement:** the physical measurement taken by the smartphone
 	
   	Possible values: 
     * *BodyAcc* - acceleration of the subject's body subtracting gravity acceleration
     * *GravityAcc* - acceleration due to gravity
     * *BodyAccJerk* - the change in acceleration of the subject's body
     * *BodyGyro* - the angular velocity of the smartphone as recorded by the gyroscope
     * *BodyGyroJerk* - the change in angular acceleration of the smartphone as recorded by the gyroscope

    *For more information regarding these measurements, please see features_info.txt in the raw dataset .zip*

3. **StatisticalValue:** the statistical value of the measurement taken
 	
	Possible values:
 	  * *Mean* - the mean of the measurement taken on the subject performing the specified activity.
 	  * *StDev* - the standard deviation of the measurement taken on the subject performing the specified activity.

4. **Axis (axial features only):** the axis on which the measurement is taken

 	Possible values: X, Y, and Z.

Axial variable names will end with an X, Y, or Z and take the following form:

> \[Domain\]\[Measurement\]\[StatisticalValue \]\[Axis\]

**Example:** 

> \[time\] + \[BodyAcc\] + \[Mean\] + \[X\] => **timeBodyAccMeanX** (column 3)

Magnitude variables, which are derived from the three axial variables take a slightly different form:

> \[Domain\]\[Measurement\]\["Mag"\]\[StatisticalValue\]

> **Example:** \[freq\] + \[BodyGyroJerk\] + \["Mag"\] + \[StDev\] => **freqBodyGyroJerkMagStDev** (column 68)




