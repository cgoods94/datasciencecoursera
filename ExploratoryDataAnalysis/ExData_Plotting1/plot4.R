
## This takes the cleaned household power data and produces plot1.png
## (Code for getting and cleaning the data can be found in 'Extras/get_and_clean.R', as well as an
## explanation for my deviation from the assignment instructions for reading the data.)
plot4 <- function( hhpowercon )
{
    ## Switches to png device and gets ready to write plot4.png
    png('plot4.png')
    
    ## Sets the parameters for base plot to 2 rows and 2 columns,
    ## filled row-wise.
    par(mfrow = c(2, 2))
    
    # Graph (1, 1): Global Active Power vs DateTime, line plot.
    with(hhpowercon, plot(DateTime, Global_active_power, 
                          type = "n",
                          xlab = "",
                          ylab = "Global Active Power"))
    with(hhpowercon, lines(DateTime, Global_active_power))
    
    # Graph (1, 2): Voltage vs DateTime, line plot.
    with(hhpowercon, plot(DateTime, Voltage,
                          type = "n",
                          xlab = "datetime",
                          ylab = "Voltage"))
    with(hhpowercon, lines(DateTime, Voltage))
    
    # Graph (2, 1): All 3 Energy Sub-Meters vs. DateTime, line plot w/ legend
    with(hhpowercon, plot(DateTime, Sub_metering_1, 
                          type = "n",
                          xlab = "",
                          ylab = "Energy sub metering"))
    with(hhpowercon, lines(DateTime, Sub_metering_1))
    with(hhpowercon, lines(DateTime, Sub_metering_2, col = "red"))
    with(hhpowercon, lines(DateTime, Sub_metering_3, col = "blue"))
    legend("topright", 
           col = c("black", "blue", "red"), 
           lwd = 2,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    # Graph (2, 2): Global Reactive Power vs DateTime, line plot
    with(hhpowercon, plot(DateTime, Global_reactive_power,
                          type = "n",
                          xlab = "datetime",
                          ylab = "Global_reactive_power"))
    with(hhpowercon, lines(DateTime, Global_reactive_power))
    
    ## Reverts to whatever device was open before the call.
    dev.off()
}