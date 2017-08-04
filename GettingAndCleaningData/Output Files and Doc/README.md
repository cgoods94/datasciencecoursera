# Getting And Cleaning Data - Course Project

### Connor Gooding - Coursera Data Science Specialization

## run_analysis.R

### Introduction and Dependencies:

This script takes the UCI HAR Dataset and turns it into a tidy data set.
It uses the dplyr package and requires the UCI HAR Dataset to be
in the working directory. 

It does so in five steps: Merge, Extract, Factorize, Label, and Summarize.

### 1. Merge

In this step, the script first reads all of the test and training data into
R data frames via read.table(). At this time, the feature names are also loaded into an
R data frame (called **features**), but nothing is done with them until the next step. 
It then column binds the **subject**, **X**, and **Y** objects for both datasets into two objects, 
called **test_full** and **train_full**, respectively. Finally, it row binds those two objects into
an object called **full**, names the subject and Y columns *"subject"* and *"activity"* respectively, 
and converts **full** into a tbl object (dplyr).

### 2. Extract

Here the script uses regular expressions and grep on the feature names to determine which columns
hold the variables for mean() and std(). It then selects those columns from **full** and saves
the result to a new tbl, **extracted**. Before moving on, it makes a character vector of the
mean and std feature names called **choiceColNames** for later use in the Label step.

**NOTE:** *Columns with meanFreq() were NOT included in the final dataset because we have both
time and frequency domain data, so the meanFreq should be present in frequency domain if you
really need it.*

### 3. Factorize

The last modification to the data values themselves comes in the Factorize step, where the script
converts the ID's in the "activity" column to their factor names. These factor names are found in
activity_labels.txt in the UCI HAR Dataset, so this step starts by bringing that data into a
data frame called **activity_labels**. The script then uses dplyr chaining on **extracted** to
left join **activity_labels** onto **extracted** by the activity ID column, convert the *"activity"*
column from IDs to factor names, and then select all columns but V2.y, which is a duplicate column
of the joined factor names. The result of all of this is saved to a new tbl, **described**.

### 4. Label

To appropriately label the data set with descriptive label names, the script then cleans up the
strings in **choiceColNames**. Specifically, the script uses three more regular expressions and the
sub function to:

* remove all non-alphabet characters from the variable names and camelcase the
	remaining characters, 
* convert the "t" or "f" at the beginning of each variable name to
	"time" or "freq", respectively, and:
* fix an odd convention of the raw dataset where the word "Body" is doubled as "BodyBody" in feature names.

Once the variable names are clean, the script adds these column
names to **described** columns 3-68.

### 5. Summarize

In the final step, the script chains the group_by and summarize functions (dplyr) to create a
tidy version of the dataset where every mean or std variable is averaged across each possible
combination of "subject" and "activity." The script then saves the result of this process to
the output tbl, **tidy**. Finally, it writes **tidy** to a text file called **tidy.txt** and
saves it to the Output Files and Doc folder.

## Summary

The run_analysis script pulls the UCI HAR dataset into R, merges the test and training datasets,
extracts only the mean and std variables, factorizes the activity IDs for each observation, gives
the feature variables descriptive names, averages all of the variables by each subject-activity
combination, and writes the output to **tidy.txt** in the Output Files and Doc folder of the working
directory.

### For more detailed descriptions of the data set and its variables, please read **codebook.md**.


