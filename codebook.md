Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw 
signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured 
at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass 
Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal 
was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
 using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk 
signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional 
signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, 
tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ,
 fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' 
 to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The original data included many calculations based on these variables, however, 
the set of variables that were estimated from these signals have been subset to only include the following:

mean(): Mean value
std(): Standard deviation


Additional vectors obtained by averaging the signals in a signal window sample. 
These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

This information was grouped by the subject and descriptive_activity_label and the average was calculated for each variable.
The subject and descriptive_activity_label are also provided for each observation. I have also fixed the variable names to
conform to R standards and added the prefix "avg_" to indicate that the values are averages.
The results include the following variables which are the average of the original variables described above:

[1] "subject"                             "descriptive_activity_label"         
 [3] "avg_tBodyAcc.mean...X"               "avg_tBodyAcc.mean...Y"              
 [5] "avg_tBodyAcc.mean...Z"               "avg_tBodyAcc.std...X"               
 [7] "avg_tBodyAcc.std...Y"                "avg_tBodyAcc.std...Z"               
 [9] "avg_tGravityAcc.mean...X"            "avg_tGravityAcc.mean...Y"           
[11] "avg_tGravityAcc.mean...Z"            "avg_tGravityAcc.std...X"            
[13] "avg_tGravityAcc.std...Y"             "avg_tGravityAcc.std...Z"            
[15] "avg_tBodyAccJerk.mean...X"           "avg_tBodyAccJerk.mean...Y"          
[17] "avg_tBodyAccJerk.mean...Z"           "avg_tBodyAccJerk.std...X"           
[19] "avg_tBodyAccJerk.std...Y"            "avg_tBodyAccJerk.std...Z"           
[21] "avg_tBodyGyro.mean...X"              "avg_tBodyGyro.mean...Y"             
[23] "avg_tBodyGyro.mean...Z"              "avg_tBodyGyro.std...X"              
[25] "avg_tBodyGyro.std...Y"               "avg_tBodyGyro.std...Z"              
[27] "avg_tBodyGyroJerk.mean...X"          "avg_tBodyGyroJerk.mean...Y"         
[29] "avg_tBodyGyroJerk.mean...Z"          "avg_tBodyGyroJerk.std...X"          
[31] "avg_tBodyGyroJerk.std...Y"           "avg_tBodyGyroJerk.std...Z"          
[33] "avg_tBodyAccMag.mean.."              "avg_tBodyAccMag.std.."              
[35] "avg_tGravityAccMag.mean.."           "avg_tGravityAccMag.std.."           
[37] "avg_tBodyAccJerkMag.mean.."          "avg_tBodyAccJerkMag.std.."          
[39] "avg_tBodyGyroMag.mean.."             "avg_tBodyGyroMag.std.."             
[41] "avg_tBodyGyroJerkMag.mean.."         "avg_tBodyGyroJerkMag.std.."         
[43] "avg_fBodyAcc.mean...X"               "avg_fBodyAcc.mean...Y"              
[45] "avg_fBodyAcc.mean...Z"               "avg_fBodyAcc.std...X"               
[47] "avg_fBodyAcc.std...Y"                "avg_fBodyAcc.std...Z"               
[49] "avg_fBodyAcc.meanFreq...X"           "avg_fBodyAcc.meanFreq...Y"          
[51] "avg_fBodyAcc.meanFreq...Z"           "avg_fBodyAccJerk.mean...X"          
[53] "avg_fBodyAccJerk.mean...Y"           "avg_fBodyAccJerk.mean...Z"          
[55] "avg_fBodyAccJerk.std...X"            "avg_fBodyAccJerk.std...Y"           
[57] "avg_fBodyAccJerk.std...Z"            "avg_fBodyAccJerk.meanFreq...X"      
[59] "avg_fBodyAccJerk.meanFreq...Y"       "avg_fBodyAccJerk.meanFreq...Z"      
[61] "avg_fBodyGyro.mean...X"              "avg_fBodyGyro.mean...Y"             
[63] "avg_fBodyGyro.mean...Z"              "avg_fBodyGyro.std...X"              
[65] "avg_fBodyGyro.std...Y"               "avg_fBodyGyro.std...Z"              
[67] "avg_fBodyGyro.meanFreq...X"          "avg_fBodyGyro.meanFreq...Y"         
[69] "avg_fBodyGyro.meanFreq...Z"          "avg_fBodyAccMag.mean.."             
[71] "avg_fBodyAccMag.std.."               "avg_fBodyAccMag.meanFreq.."         
[73] "avg_fBodyBodyAccJerkMag.mean.."      "avg_fBodyBodyAccJerkMag.std.."      
[75] "avg_fBodyBodyAccJerkMag.meanFreq.."  "avg_fBodyBodyGyroMag.mean.."        
[77] "avg_fBodyBodyGyroMag.std.."          "avg_fBodyBodyGyroMag.meanFreq.."    
[79] "avg_fBodyBodyGyroJerkMag.mean.."     "avg_fBodyBodyGyroJerkMag.std.."     
[81] "avg_fBodyBodyGyroJerkMag.meanFreq.."

