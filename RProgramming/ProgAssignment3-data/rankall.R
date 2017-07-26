rankall <- function(outcome, num = "best") {
    ## Read outcome data
    o_data <- read.csv("outcome-of-care-measures.csv", na.strings="Not Available", stringsAsFactors = FALSE)
    
    ## Check that outcome is valid
    if(is.na(match(outcome, c("heart attack", "heart failure", "pneumonia"))))
    {
        stop("invalid outcome")
    }
    
    ## For each state, find the hospital of the given rank
    
    state_df <- data.frame(hospital = character(0), state = character(0))
    state_row <- vector()
    state_data <- data.frame()
    
    o_index <- switch( outcome,
                       "heart attack" = 11,
                       "heart failure" = 17,
                       "pneumonia" = 23)
    
    o_data <- o_data[ , c(2, 7, o_index)]
    names(o_data) <- c("Name", "State", "30DayDR")
    
    state_list <- unique(o_data$State)
    for( state in state_list )
    {
        state_data <- na.omit(o_data[o_data$State == state, ])
        if (nrow(state_data) == 0)
        {
            next
        }
        if (num == "best")
        {
            state_row <- head(state_data[order(state_data$`30DayDR`, state_data$Name),], 1)
            state_df <- rbind(state_df, state_row[1:2])
        }
        else if (num == "worst")
        {
            state_row <- tail(state_data[order(state_data$`30DayDR`, state_data$Name),], 1)
            state_df <- rbind(state_df, state_row[1:2])
        }
        else if (num > nrow(state_data))
        {
            state_row <- c(NA, state)
            state_df <- rbind(state_df, state_row)
        }
        else
        {
            state_row <- state_data[order(state_data$`30DayDR`, state_data$Name),][num,]
            state_df <- rbind(state_df, state_row[1:2])
        }
    }
    
    colnames(state_df) <- c("hospital", "state")
    rownames(state_df) <- state_df$state
    state_df[order(state_df$state),]
}