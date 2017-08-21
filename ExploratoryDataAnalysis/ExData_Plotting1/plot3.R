
## This takes the cleaned household power data and produces plot1.png
## (Code for getting and cleaning the data can be found in 'Extras/get_and_clean.R', as well as an
## explanation for my deviation from the assignment instructions for reading the data.)
plot3 <- function( hhpowercon )
{
    ## Switches to png device and gets ready to write plot3.png
    png('plot3.png')
    
    ## Sets up the plot area for DateTime and the three Sub_metering
    ## variables without putting data on the plot and sets the appropriate
    ## axis labels.
    with(hhpowercon, plot(DateTime, Sub_metering_1, 
                          type = "n",
                          xlab = "",
                          ylab = "Energy sub metering"))
    
    ## Writes the line plot for each Energy Sub-metering relationship to DateTime
    ## and a legend describing the graph.
    with(hhpowercon, lines(DateTime, Sub_metering_1))
    with(hhpowercon, lines(DateTime, Sub_metering_2, col = "red"))
    with(hhpowercon, lines(DateTime, Sub_metering_3, col = "blue"))
    legend("topright", 
           col = c("black", "blue", "red"), 
           lwd = 2,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ## Reverts to whatever device was open before the call.
    dev.off()
}