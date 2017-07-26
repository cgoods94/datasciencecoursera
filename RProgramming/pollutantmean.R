pollutantmean <- function(directory, pollutant, id=1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    
    ## create an empty vector and append it with each file's data
    datacol <- vector("numeric")
    
    ## set working directory to directory
    setwd(directory)
    
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
        
        datacol <- c(datacol, file[,pollutant][!is.na(file[,pollutant])])
      
    }
    
    setwd('..')
    
    mean(datacol)

}