#######################################################################################
## This function makes a tidy dataset of the UCI HAR Dataset. It does so in 5 steps:
##
## 1. Merge the training and test sets to create one data set
## 2. Extract only the measurements on the mean and std for each observation
## 3. Descriptively name the activities in the dataset
## 4. Label the data set variables with descriptive variable names
## 5. From the data set in Step 4, create a second tidy dataset
##    with the average of each variable for each activity and subject.
##
## Dependencies: dplyr
#######################################################################################

run_analysis <- function()
{
    library(dplyr)
    
    if(!file.exists('./UCI HAR Dataset'))
    {
        stop("UCI HAR Dataset not found. Make sure you are in the parent folder
             of the UCI HAR Dataset, ensure that the dataset is unzipped and try again.")
    }
    
    ## We'll put the tidy dataset in its own folder outside of the raw dataset
    if(!file.exists('./Output Files and Doc'))
    {
        dir.create('./Output Files and Doc')
    }
    setwd('./UCI HAR Dataset')
    
    ##############################################
    ## Step 1: Merge the training and the test sets
    ## to create one data set. 
    ##############################################
    
    # Bring all the test data into tibbles and prep it for merge
    features <- read.table('features.txt', stringsAsFactors = FALSE, nrow = 561)
    
    subject_test <- read.table("./test/subject_test.txt", nrow = 2947)
    X_test <- read.table("./test/X_test.txt", nrow = 2947)
    Y_test <- read.table("./test/Y_test.txt", nrow = 2947)
    
    test_full <- cbind(subject_test, Y_test, X_test)
    
    # Repeat with train data
    subject_train <- read.table("./train/subject_train.txt", nrow = 7352)
    X_train <- read.table("./train/X_train.txt", nrow = 7352)
    Y_train <- read.table("./train/Y_train.txt", nrow = 7352)
    
    train_full <- cbind(subject_train, Y_train, X_train)
    
    # Combine test and training data
    full <- rbind(test_full, train_full)
    
    # add column names to Y and subject for now so we can convert to tbl
    colnames(full)[1:2] <- c("subject", "activity")
    full <- as.tbl(full)
    
    ##############################################
    ## Step 2: Extract only the measurements on the 
    ## mean and standard deviation for each 
    ## measurement.
    ##############################################
    
    choiceCols <- grep("mean\\(\\)|std\\(\\)", features$V2)
    extracted <- select(full,c(1:2, choiceCols + 2))
    choiceColNames <- features$V2[choiceCols]
    
    ##############################################
    ## Step 3: Use descriptive activity names to 
    ## name the activities in the data set.
    ##############################################
    
    activity_labels <- read.table('./activity_labels.txt', stringsAsFactors = FALSE)
    
    described <- extracted %>%
                    left_join(activity_labels, by = c("activity" = "V1")) %>% 
                    mutate(activity = V2.y) %>%
                    select(-V2.y)
            
    ##############################################
    ## Step 4: Appropriately label the data set
    ## with descriptive label names.
    ##############################################
    choiceColNames <- sub("\\-mean\\(\\)\\-?", "Mean", choiceColNames)
    choiceColNames <- sub("\\-std\\(\\)\\-?", "StDev", choiceColNames)
    choiceColNames <- sub("^t", "time", choiceColNames)
    choiceColNames <- sub("^f", "freq", choiceColNames)
    choiceColNames <- sub("BodyBody", "Body", choiceColNames)
    
    colnames(described)[3:68] <- choiceColNames
    
    ##############################################
    ## Step 5: From the data set in Step 4, create a
    ## second, independent tidy data set with the
    ## average of each variable for each activity
    ## and subject.
    ##############################################
    
    tidy <- described %>% group_by(subject, activity) %>% summarize_all(mean)
    
    setwd('..')
    write.table(tidy, './Output Files And Doc/tidy.txt', row.names = FALSE)
    
    tidy
}