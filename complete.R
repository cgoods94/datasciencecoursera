complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
  
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
  
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ... 
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
  
    setwd(directory)
    
    datacol <- vector("numeric")
  
    for (i in id)
    {
        ## convert id to filename and read the csv
        if (i < 10)
        {
            file <- read.csv(paste("00", i, ".csv", sep = ""))
        } else if (i < 100)
        {
            file <- read.csv(paste ("0", i, ".csv", sep = ""))
        } else
        {
            file <- read.csv(paste(i, ".csv", sep = ""))
        }
      
        datacol <- c(datacol, sum(complete.cases(file))) 
    }
    setwd('..')
    
    data.frame(id = id, nobs = datacol)
  
}