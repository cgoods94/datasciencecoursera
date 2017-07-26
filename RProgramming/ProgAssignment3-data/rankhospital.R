rankhospital <- function (state, outcome, num = "best") {
    ## Read outcome data
    o_data <- read.csv("outcome-of-care-measures.csv", na.strings="Not Available", stringsAsFactors = FALSE)
    
    ## Check that state and outcome are valid
    if(is.na(match(state, unique(o_data$State))))
    {
        stop("invalid state")
    }
    if(is.na(match(outcome, c("heart attack", "heart failure", "pneumonia"))))
    {
        stop("invalid outcome")
    }
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    o_index <- switch( outcome,
                       "heart attack" = 11,
                       "heart failure" = 17,
                       "pneumonia" = 23)
    
    o_data <- o_data[ , c(2, 7, o_index)]
    names(o_data) <- c("Name", "State", "30DayDR")
    o_data <- na.omit(o_data[o_data$State == state,])
    
    if(num == "best")
    {
        head(o_data[order(o_data$`30DayDR`, o_data$Name),], 1)[[1]]
    }
    else if (num == "worst")
    {
        
        tail(o_data[order(o_data$`30DayDR`, o_data$Name),], 1)[[1]]
    }
    else if (num > nrow(o_data))
    {
        return(NA)
    }
    else
    {
        o_data[order(o_data$`30DayDR`, o_data$Name),][[num,1]]
    }
    
}