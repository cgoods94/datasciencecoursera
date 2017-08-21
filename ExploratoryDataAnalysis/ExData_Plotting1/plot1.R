
## This takes the cleaned household power data and produces plot1.png
## (Code for getting and cleaning the data can be found in 'Extras/get_and_clean.R', as well as an
## explanation for my deviation from the assignment instructions for reading the data.)
plot1 <- function( hhpowercon )
{
    ## Switches to png device and gets ready to write plot1.png
    png('plot1.png')
    
    ## Creates a histogram of Global Active Power with red buckets
    ## and the appropriate axis labels.
    hist(hhpowercon$Global_active_power, 
         col = "red",
         xlab = "Global Active Power (kilowatts)",
         main = "Global Active Power")
    
    ## Reverts to whatever device was open before the call.
    dev.off()
}