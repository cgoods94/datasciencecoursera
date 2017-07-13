corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files.
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    
    ## Determine the eligible files and make a vector of their id's.
    dirsize <- length(list.files(directory))
    eligible <- complete(directory, 1:dirsize)
    idcol <- eligible[eligible$nobs >= threshold,"id"]
    
    setwd(directory)
    
    ## Create empty numeric vector to put correlations in
    datacol <- vector("numeric")
    
    for (i in idcol)
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
        
        file <- file[complete.cases(file), ]
            if (length(file[,"sulfate"]) > 0)
            {
                datacol <- c(datacol, cor(file["sulfate"], file["nitrate"]))
            }
    }
    
    setwd('..')
    
    datacol
}