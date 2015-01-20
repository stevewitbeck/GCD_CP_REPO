##Set your working directory to the main directory containing the test and training directories
setwd("C:/Users/switbeck/Jan Coursera")

##User read.table to read the x_train, y_train, and subject_train files
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

##Bind all three files together so that the first column is the subject id, the second
##is the activity, and the rest is the 561 data columns.  Store this in the object 'train'
xy_train <- cbind(y_train,x_train)
train <- cbind(subject_train, xy_train)

##Name the first two columns
colnames(train)[1:2] <- c("subject","activity")

##load the dplyr package and read the object 'train' into the dplyr format
library(dplyr)
dp_train <- tbl_df(train)


## Do the same as above except for test
##User read.table to read the x_test, y_test, and subject_test files
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

##Bind all three files together so that the first column is the subject id, the second
##is the activity, and the rest is the 561 data columns.  Store this in the object 'test'
xy_test <- cbind(y_test,x_test)
test <- cbind(subject_test, xy_test)

##Name the first two columns
colnames(test)[1:2] <- c("subject","activity")
##Read the object 'train' into the dplyr format
dp_test <- tbl_df(test)


##This is where part 1 of the assignment is accomplished, the 'training' and 'test data sets
##are merged together and the result is stored in the dplyr format
dp_tt <- rbind(train,test)
dp_tt <- tbl_df(dp_tt)

##load the names of the 561 columns
feat <- read.table("features.txt")
##Use grep to search for the strings 'mean' or 'std'
##within column 2 of feat which contains the col names
##Assign this to object ms_cols and add 2 since the first
##two columns are the subject and activity ids
ms_cols <- grep("mean|std",feat[,2]) +2

##This accomplishes part 2 of the assignment.
##It returns only the columns for the measurements on the mean and stdev 
##and assigns it to object 'ms'.
ms <- dp_tt[,c(1:2,ms_cols)]

##This reads the descriptive activity labels into the object 'alabels'
alabels <- read.table("activity_labels.txt")
colnames(alabels)[1:2] <- c("activity_id","descriptive_activity_name")

##This accomplishes part 3 of the assignment by adding the descriptive activity labels to the data
##Sort is set to false in the merge so we can still apply the column names later
ms_alab <- merge(ms,alabels,by.x = "activity", by.y = "activity_id", sort = FALSE)



##Column names are identified and assigned to object 'cnms'. Make.names is used to remove
##illegal characters in the R language.
ms_cnames <- grep("mean|std",feat[,2])
cnms <- cbind(c("subject","activity_id",make.names(feat[ms_cnames,2])))
cnms <- rbind(cnms,"descriptive_activity_label")

##Column names are applied to the object 'ms_alab'.  This accomplishes part 4 of the assignment
##by adding the descriptive variable names from the 'features.txt' file
colnames(ms_alab) <- cnms
ms_alab_col <- tbl_df(ms_alab)


