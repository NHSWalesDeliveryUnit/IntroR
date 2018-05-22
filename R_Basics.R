
#Welcome to an R for beginners training session.

#This session will take you through an introduction into the use
  #of R, alongside an introduction into:
   #downloading and installing R
   #understanding how R handles data
   #loading data into R
   #summarising data
   #manipulating data
   #plotting data
   #running statistical tests

##############################
#DOWNLOADING AND INSTALLING R#
##############################

#R can be run in a number of different modes and user interfaces.
#The general software (latest version R-3.5.0) can be found here:
   # https://cloud.r-project.org/

#This is the standard version of R, using two different windows to work:
   #Console window- used to run code line by line
   #Editor window - used to create groups of code to run at a time

#This session will focus on an add-on piece of software called RStudio Desktop.
#This is a free and open-source integrated development environment that
#many find easier to use than the standard R.

#RStudio desktop can be donloaded and installed via the following link:
   # https://www.rstudio.com/products/rstudio/download/

#It is recommended that installation is to your local machine.
#Be aware that admin rights are required to install.  If software is installed to 
#a global environment, a local repository will still be required to install
#any additional packages to be loaded.

#The location used to install packages can be found by using the following code:
.libPaths()
#The location path of installed packages can be changed if required by using the same code
#but with the drive location included (make sure you reverse the direction of all slashes!)
.libPaths("C:/Users/al126229/Documents/R/win-library/3.4")

#Installation instructions can be found here:
  # https://github.com/NHSWalesDeliveryUnit/IntroR



#################################
#UNDERSTANING HOW R HANDLES DATA#
#################################

#In RStudio, commands can be written directly into the Console window,
#or commands can be written in the Editor window and run at a later period.

#For example, the below code can be run by highligting the line and clicking on Run.
3 + 4

#The code will then run in the Console window, producing an output at the same time.

#R makes use of "Objects" in order to generate outputs.  This is a benefit as
#any new packages that are developed can make reference to already used methods.
#For example, the 'plot' function can be used to produce a scatter plot of a data set,
#as well as being used to provide the output for a regression analysis.

#########################
#Vectors and Data Frames#

#In general, R handles data sets via both:
   #Vectors, and
   #Data frames

#Vectors can be thought of as a list of variables of a particular type
#An example of a vector would be a list of numbers, i.e:
c(1,2,3,4,5,6)

#"c" is shorthand for combine

#This can be assigned to a variable name using the following syntax:
listNum <- c(1,2,3,4,5,6)

#Note the use of "<-" rather than "=" to assign to a variable.

#This vector can then be recalled by listing the same variable name:
listNum


#Data frames can be thought of as a collection of vectors or a table.
#These can be combined to form a data set (i.e. data frame).

#For example, a data frame can be created using the following logic:
CRN <- c("A000000001", "A000000002", "A000000003")
WeeksWait <- c(8, 9, 10)
tblWeeksWait <- data.frame(CRN, WeeksWait)

#We can then call our new table to see what it looks like
tblWeeksWait

#There are other ways to view or edit this table once it's been created.
  #You can either click on the newly formed data frame in the top right Environment window
   #This is a list of all of the variables that you have created

#To view all data structures saved to memory, you can use the function "ls":
ls()

#We can call another function call "Fix" that will allow editing of the data in another window
fix(tblWeeksWait)


##########################
#Important things to note#

#Case Sensitivity#

#It is important at this point to note that R is case sesitive.
#This is important to remember as functions and user created variables will
#not be recognised unless they adhere to the same case they were written in.

#Thankfully, RStudio has a built in intelligent code completion that recognises
#what you type and provides a completed version for you.

#The Bottom Right Window#

#The bottom right window of RStudio has a number of tabs.  These Include:
  #Files    - a browser option linked to your Documents folder
  #Plots    - a window to view any visual outputs you create
  #Packages - a list of some of the available packages that can be installed
  #Help     - very useful window to search for help information relating to all functions


####################################
#SETTING THE WORKING DIRECTORY IN R#
####################################

#Before importing or exporting data in R, it is wise to set a working directory 
#to be used.  This is the source folder for any data to be read from,
#or where any outputs from R can be written to.
setwd("C:/Users/al126229/Desktop/")

#Note that the back slashes need to be replaced with forward slashes


#####################
#LOADING DATA INTO R#
#####################

#In reality, creating data frames from scratch isn't something 
#you are likely to do very often.  Large data sets can be loaded into R
#via various methods, one of which is in a csv format.

#An example waiting list using made up data has been saved on the GitHub page:
# https://github.com/NHSWalesDeliveryUnit/IntroR

#R has the ability to load data from directly from a webpage as well 
#as from a local directory.

#The following code uses the read.csv function to load a csv into R.
#It also uses the 'url' code to take data data directy from the webpage.
WL_url <- read.csv(url("https://raw.githubusercontent.com/NHSWalesDeliveryUnit/IntroR/master/WaitingList.csv"), head=TRUE)

#Data can also be loaded from the working directory set above
WL_File <- read.csv("WaitingList.csv", head=TRUE)

#If you want to find out more about a function at any point,
#you can simply add a question mark infront of the function.
?read.csv

#The above line of script will then open the help window for the function.

#Data can be written back to file in the same way as data read from it.
#The below will write the file WL_File back to the working directory,
 #giving it the filename "WaitingList1.csv"
write.csv(WL_File, "WaitingList1.csv")


#################################
#QUERYING OR MANIPULATING DATA R#
#################################

#You can view the field names in the uploaded file:
names(WL_File)

#Given that the file contains c20,000 rows, you may wish to view the
  #first or last few rows
head(WL_File)
tail(WL_File)

#A top level summary of the data frame can be viewed by using the
  #summary function
summary(WL_File)

#Specific columns can be selected by listing the column after the data frame name.
#A dollar string '$' is used to seperate the data frame from the column
WL_File$WeeksWait

#If you want to identify a specific summary statistic, you can then use this
  #same syntax wrapped within a function
length(WL_File$WeeksWait)
mean(WL_File$WeeksWait)
sd(WL_File$WeeksWait)
min(WL_File$WeeksWait)
max(WL_File$WeeksWait)

#You may wish to group a specific summary statistic by another variable, i.e.:
by(WL_File$WeeksWait, WL_File$Spec, mean)

#The above provides the mean weeks wait by specialty, however this isn't
  #in a very good format if you wanted to reference the output somewhere else.

#In order to output a table (i.e. data frame), you need to use the tapply function
tapply(WL_File$WeeksWait, WL_File$Spec, mean)

#This then provides an out put in a better tabular formatm that can now
  #be converted to a data frame
meanWeeksWait <- data.frame(tapply(WL_File$WeeksWait, WL_File$Spec, mean))

#Subsets of a data frame can be created if you wish to work with the data
  #without affecting the original file
Specialty1 <- WL_File[WL_File$Spec == "Specialty1",]

#Note the use of == meaning "exactly equal to" and used for equality testing


#Summary statistics can then generated on this new object,
  #i.e. a count of patients by stage of pathway

#Due to the open source nature of R, users can create their own packages
  #with their own functions.  An example of this would be the use of the
  #package "plyr" to count the number of occurences grouped by something else

#The package plyr first needs to be installed (note the use of quotes):
install.packages("plyr")

#The package the needs to be loaded into the library.
#A package only needs to be installed once for your instanc of R,
  #however it needs to loaded into the library each time you start
  #a new session of R.
library(plyr)

#The 'count' function within plyr can now be used to count the
  #number of patients in Specialty1 by stage of pathway
count(Specialty1, c("Stage.of.Pathway"))



####################
#PLOTTING DATA IN R#
####################

#R has the functionality to plot many different things from graphs to maps
  #to images

#You can plot many different graphs in R via the general "plot" function
cntWeeksWait <- count(Specialty1, c("WeeksWait"))

#The standard output for a plot function will be a scatter plot
plot(cntWeeksWait$WeeksWait, cntWeeksWait$freq)

#You can change the graph type within the plot function
plot(cntWeeksWait$WeeksWait, cntWeeksWait$freq, "h")
plot(cntWeeksWait$WeeksWait, cntWeeksWait$freq, "l")

#If you wanted a simple histogram of weeks wait however, it's much quicker
  #to use the "hist" function
hist(Specialty1$WeeksWait)

#The above has grouped the histogram bins into 10s.
#Adding 'breaks' to the code can change this
hist(Specialty1$WeeksWait, breaks=seq(0,115,by=1))

#You could also make this more dynamic by storing the longest wait
  #in a variable.  This makes the file more dynamic
maxWait <- max(Specialty1$WeeksWait)
hist(Specialty1$WeeksWait, 
     breaks=seq(0,maxWait,by=1))

#Your histogram can be enhanced visually by changing other settings
hist(Specialty1$WeeksWait, 
     breaks=seq(0,maxWait,by=1),
     col="lightblue",
     main="Histogram of Those Waiting by Weeks Wait - Specialty1",
     xlab = "Weeks Wait")
axis(1, at=seq(0,maxWait, 5))

#If you wish, you can the output that plot as a specific file,
  #be that an image, pdf etc.
#This will then output the designated file to the working directory.
png("Specialty1WeeksWaitHistogram.png")
hist(Specialty1$WeeksWait, 
     breaks=seq(0,maxWait,by=1),
     col="lightblue",
     main="Histogram of Those Waiting by Weeks Wait - Specialty1",
     xlab = "Weeks Wait")
axis(1, at=seq(0,maxWait, 5))
dev.off()

################################
#RUNNING STATISTICAL TESTS IN R#
################################

#R has the ability to runa a number of statistical tests.
#In the following example, we will compare the mean wait in weeks
  #for Specialty1 to the mean wait in weeks for Specialty2 to see
  #if there is a statistically significant difference between them.

t.test(WL_File$WeeksWait[WL_File$Spec=="Specialty1"], 
       WL_File$WeeksWait[WL_File$Spec=="Specialty2"])

#The results of the t-test have an incredibly small p-value,
  #indicating a statisically significant difference between
  #the mean weeks wait of both specialties.

#R can also run ANOVA tests to compare multiple groups at one time.
ANOVASpec1 <- aov(Specialty1$WeeksWait~Specialty1$Stage.of.Pathway)

#Not a couple of things in the above:
  #the use of ~ to seperate the the thing being tested from the grouping variable
  #the result is being saved to another variable

#The result has been saved to another variable in order to
  #generate a summary to see the results
aov(Specialty1$WeeksWait~Specialty1$Stage.of.Pathway)
summary(ANOVASpec1)

#If you really wanted to, you could then perform a pair-wise
  #comparison to find the significantly different stages of pathway
pairwise.t.test(Specialty1$WeeksWait, 
                Specialty1$Stage.of.Pathway)
