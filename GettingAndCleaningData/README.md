# Getting And Cleaning Data - Course Project

## Coursera Data Science Specialization (Johns Hopkins)

### run_analysis.R

#### Introduction and Dependencies:

This script takes the UCI HAR Dataset and turns it into a tidy data set.
It uses the dplyr package and requires the UCI HAR Dataset to be
in the working directory. 

It does so in five steps: Merge, Extract, Name, Label, and Summarize.

#### 1. Merge

In this step, the script first reads all of the test and training data into
R data frames via read.table(). At this time, the feature names are also loaded into an
R data frame (called **features**), but nothing is done with them until the next step. 
It then column binds the subject, X, and Y objects from test and train into two objects, 
called **test_full** and **train_full**, respectively. Finally, it row binds those two objects into
an object called **full**, names the subject and Y columns "subject" and "activity" respectively, 
and converts **full** into a tbl object (dplyr).

#### 2. Extract

Here the script uses regular expressions and grep on the feature names to determine which columns
hold the variables for mean and std. It then selects those columns from **full** and saves
the result to a new tbl, **extracted**. Before moving on, it makes a character vector of the
mean and std feature names called **choiceColNames** for later use in the Label step.

#### 3. 


