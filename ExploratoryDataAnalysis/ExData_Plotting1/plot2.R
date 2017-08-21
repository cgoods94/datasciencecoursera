
## This takes the cleaned household power data and produces plot1.png
## (Code for getting and cleaning the data can be found in 'Extras/get_and_clean.R', as well as an
## explanation for my deviation from the assignment instructions for reading the data.)
plot2 <- function( hhpowercon )
{
    ## Switches to png device and gets ready to write plot2.png
    png('plot2.png')
    
    ## Sets up the plot area for DateTime and Global_active_power
    ## without putting data on the plot and sets the appropriate
    ## axis labels.
    with(hhpowercon, plot(DateTime, Global_active_power, 
                          type = "n",
                          xlab = "",
                          ylab = "Global Active Power (kilowatts)"))
    
    ## Writes the line plot of Global Active Power vs DateTime.
    with(hhpowercon, lines(DateTime, Global_active_power))
    
    ## Reverts to whatever device was open before the call.
    dev.off()
}