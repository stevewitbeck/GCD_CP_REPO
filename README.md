This data is the result of experiments carried out by the following people:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
.Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers
 was selected for generating the training data and 30% the test data. 

The training and tests were then merged to create one data set, then only the measurements
on the mean and standard deviation were extracted from the data set.  Then, descriptive activity
names were used to name the activities in the data set.  The variables were then appropriately
labelled with descriptive variable names and illegal characters were removed from the column names.  
Each of the variables was then averaged by the activity and subject.  For more detail on how this was accomplished,
the script run_analysis contains detailed comments for each step of the script.

No parameters are required for the script, one must only change the working directory to the main directory
that contains the test and training directories which can be downloaded from 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  
Download the dataset and unzip the contents to its own folder.  Change the working directory in line 2
of the script to this directory.

Load the script into R studio and press run.  The results for each part of the assignment will be stored
in objects 'Part1', 'Part2', etc.  To view the result print the variable in the console.