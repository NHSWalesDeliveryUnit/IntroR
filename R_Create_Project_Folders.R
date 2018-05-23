# make my project folders for an R Studio project

#Set mydir variable to the project folder location
mydir <- getwd() # Set mydir

# Now create the subfolders
d <- NULL # create a null or empty vector

# Assign each folder to an element in the vector
d[1]  <- mydir
d[2]  <- paste(mydir,'Attic', sep='/')
d[3]  <- paste(mydir,'Data', sep='/')
d[4]  <- paste(mydir,'Plot', sep='/')
d[5]  <- paste(mydir,'Program', sep='/')
d[6]  <- paste(mydir,'Protocol',sep='/')
d[7]  <- paste(mydir,'Result', sep='/')
d[8]  <- paste(mydir,'Paper', sep='/')
d[9]  <- paste(mydir,'Tmp',sep='/')
d[10] <- paste(mydir,'Log',sep='/')
d[11] <- paste(mydir,'Slides',sep='/')


# run a loop to create each folder and subfolder
for(i in 1:length(d)) dir.create(d[i], showWarnings = FALSE)

#Displays a list of the folders in the file pane
dir() # list subfolders