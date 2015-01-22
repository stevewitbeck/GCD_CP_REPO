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
part1 <- dp_tt

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
##I include the activity and subject at this point in order to identify the observations.

ms <- dp_tt[,c(1:2,ms_cols)]
part2 <- ms

##This reads the descriptive activity labels into the object 'alabels'
alabels <- read.table("activity_labels.txt")
colnames(alabels)[1:2] <- c("activity_id","descriptive_activity_name")

##This accomplishes part 3 of the assignment by adding the descriptive activity labels to the data.  
##I used sqldf as I find it works better than merge and it doesnt reorder your columns or data
library(sqldf)
ms_alab <- sqldf("select ms.*, alabels.descriptive_activity_name from ms, 
                 alabels where ms.activity = alabels.activity_id")
ms_alab <- tbl_df(ms_alab)
part3 <- ms_alab


##Column names are identified and assigned to object 'cnms'. Make.names is used to remove
##illegal characters in the R language.
ms_cnames <- grep("mean|std",feat[,2])
cnms <- cbind(c("subject","activity_id",make.names(feat[ms_cnames,2])))
cnms <- rbind(cnms,"descriptive_activity_label")

##Column names are applied to the object 'ms_alab'.  This accomplishes part 4 of the assignment
##by adding the descriptive variable names from the 'features.txt' file
colnames(ms_alab) <- cnms
part4 <- cnms

ms_alab_col <- tbl_df(ms_alab)
##This rearranges the columns so the subject, activity_id and descriptive_activity_label are up front.
##I also remove the activity_id so I can group by and use the summarize_each() function later
ms_alab_col <- select(ms_alab_col, c(1,82,3:81))

##This establishes the groups for use in the summarise_each() function
ms_alab_col <- group_by(ms_alab_col, subject, descriptive_activity_label)

##Here I use the summarise_each() function to compute the means of each variable by each activity and subject
##and assign it to object 'means'.
##This data is tidy because each variable resides in one column and each different observation of a particular
##variable is in a different row.  The data is in wide form.  This accomplishes part 5 of the assignment
means <- summarise_each(ms_alab_col, funs(mean))
##This renames the columns to show that the results contain values that consist of averages
colnames(means)[3:81] <- paste("avg_", colnames(means)[3:81], sep="")
part5 <- means
