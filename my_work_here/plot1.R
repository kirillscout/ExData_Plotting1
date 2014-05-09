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

#### PLOTTING (plot1.png)

png(filename = "plot1.png", bg = "transparent")
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()