# Getting And Cleaning Data - Course Project

### Connor Gooding - Coursera Data Science Specialization

## Code Book

### Raw Data Source

The raw data comes from experiments on Human Activity Recognition Using Smartphones conducted
at Università degli Studi di Genova in Genoa, Italy. UC Irvine's Web page for this dataset can
be found [here,](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
while the .zip file of said data can be found [here.](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip)

**IMPORTANT:** 

### Overview

The experiments that yielded this data involved 30 subjects (ages 19-48) performing six different activities
(WALKING on a level plane, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING down)
while wearing a Samsung Galaxy S II smartphone on the waist. The Samsung Galaxy S II smartphone has an
embedded accelerometer and gyroscope, making it able to capture 3-dimensional linear acceleration and angular
velocity. The signals from the accelerometer and gyroscope were also processed to yield variables in the time 
and frequency domains.

### Variable Name Format

There are two forms for the descriptive variable names in the tidy data set.

Axial variables will end with an X, Y, or Z and take the following form:

\[Domain\]\[Measurement\]\[StatisticalValue \]\[Axis\]

Magnitude variables, which are derived from the three axial variables take a slightly different form:

\[Domain\]\[Measurement\]\[Mag\]\[statistical value\]




