#### READING DATA

# Get column names
cn <- as.character(read.table("household_power_consumption.txt", 
                              sep=";", nrows = 1, na.strings = "?",
                              colClasses = "character")
                   [1,])

# Set column classes
classes <- c("character", "character", "numeric","numeric","numeric",
             "numeric","numeric","numeric","numeric")

# Read data
data <- read.table("household_power_consumption.txt", sep=";", 
                   na.strings = "?", skip = 66637, nrows = 2880, comment.char = "", colClasses = classes,
                   col.names = cn)

## Function to join Date and Time into one value
conv <- function(x){
        vec <- vector("character")
        for (i in 1:nrow(x)) {
                dt <- paste(x[i,1], x[i,2]) 
                vec <- c(vec, dt)
        }
        vec
}

## Function to convert Date/Time value to POSIX

POSIXconv <- function(x){
        as.POSIXct(strptime(x, "%d/%m/%Y %H:%M:%S"))
}

## Add POSIX column to data set
datetime <- conv(data)
posix <- POSIXconv(datetime)
data <- cbind(data, "posix" = as.data.frame(posix))


#### PLOTTING (plot2.png)

png(filename = "plot2.png", bg = "transparent")
plot(data$posix, data$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()