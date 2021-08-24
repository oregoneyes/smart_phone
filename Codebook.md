Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Activities during test and training sessions were as follows:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

Each subject had training and test data for these 6 activities. The test and training data were combined. Variables that measured mean and standard deviation were selected for further analysis. The activity vector was modified to provide activity descriptions in the place of a numerical specification. The completed data set is reported as red_sub_test.

The mean of each sensor's measurement for each subject doing each activity were calculated and reported under the appropriate variable. The final data frame means_df is grouped by subject and then by activity.

The complete list of 88 variables of each feature vector is listed below.

 [1] "subject"                                  "activity"                                
 [3] "1 tBodyAcc-mean()-X"                      "2 tBodyAcc-mean()-Y"                     
 [5] "3 tBodyAcc-mean()-Z"                      "41 tGravityAcc-mean()-X"                 
 [7] "42 tGravityAcc-mean()-Y"                  "43 tGravityAcc-mean()-Z"                 
 [9] "81 tBodyAccJerk-mean()-X"                 "82 tBodyAccJerk-mean()-Y"                
[11] "83 tBodyAccJerk-mean()-Z"                 "121 tBodyGyro-mean()-X"                  
[13] "122 tBodyGyro-mean()-Y"                   "123 tBodyGyro-mean()-Z"                  
[15] "161 tBodyGyroJerk-mean()-X"               "162 tBodyGyroJerk-mean()-Y"              
[17] "163 tBodyGyroJerk-mean()-Z"               "201 tBodyAccMag-mean()"                  
[19] "214 tGravityAccMag-mean()"                "227 tBodyAccJerkMag-mean()"              
[21] "240 tBodyGyroMag-mean()"                  "253 tBodyGyroJerkMag-mean()"             
[23] "266 fBodyAcc-mean()-X"                    "267 fBodyAcc-mean()-Y"                   
[25] "268 fBodyAcc-mean()-Z"                    "294 fBodyAcc-meanFreq()-X"               
[27] "295 fBodyAcc-meanFreq()-Y"                "296 fBodyAcc-meanFreq()-Z"               
[29] "345 fBodyAccJerk-mean()-X"                "346 fBodyAccJerk-mean()-Y"               
[31] "347 fBodyAccJerk-mean()-Z"                "373 fBodyAccJerk-meanFreq()-X"           
[33] "374 fBodyAccJerk-meanFreq()-Y"            "375 fBodyAccJerk-meanFreq()-Z"           
[35] "424 fBodyGyro-mean()-X"                   "425 fBodyGyro-mean()-Y"                  
[37] "426 fBodyGyro-mean()-Z"                   "452 fBodyGyro-meanFreq()-X"              
[39] "453 fBodyGyro-meanFreq()-Y"               "454 fBodyGyro-meanFreq()-Z"              
[41] "503 fBodyAccMag-mean()"                   "513 fBodyAccMag-meanFreq()"              
[43] "516 fBodyBodyAccJerkMag-mean()"           "526 fBodyBodyAccJerkMag-meanFreq()"      
[45] "529 fBodyBodyGyroMag-mean()"              "539 fBodyBodyGyroMag-meanFreq()"         
[47] "542 fBodyBodyGyroJerkMag-mean()"          "552 fBodyBodyGyroJerkMag-meanFreq()"     
[49] "555 angle(tBodyAccMean,gravity)"          "556 angle(tBodyAccJerkMean),gravityMean)"
[51] "557 angle(tBodyGyroMean,gravityMean)"     "558 angle(tBodyGyroJerkMean,gravityMean)"
[53] "559 angle(X,gravityMean)"                 "560 angle(Y,gravityMean)"                
[55] "561 angle(Z,gravityMean)"                 "4 tBodyAcc-std()-X"                      
[57] "5 tBodyAcc-std()-Y"                       "6 tBodyAcc-std()-Z"                      
[59] "44 tGravityAcc-std()-X"                   "45 tGravityAcc-std()-Y"                  
[61] "46 tGravityAcc-std()-Z"                   "84 tBodyAccJerk-std()-X"                 
[63] "85 tBodyAccJerk-std()-Y"                  "86 tBodyAccJerk-std()-Z"                 
[65] "124 tBodyGyro-std()-X"                    "125 tBodyGyro-std()-Y"                   
[67] "126 tBodyGyro-std()-Z"                    "164 tBodyGyroJerk-std()-X"               
[69] "165 tBodyGyroJerk-std()-Y"                "166 tBodyGyroJerk-std()-Z"               
[71] "202 tBodyAccMag-std()"                    "215 tGravityAccMag-std()"                
[73] "228 tBodyAccJerkMag-std()"                "241 tBodyGyroMag-std()"                  
[75] "254 tBodyGyroJerkMag-std()"               "269 fBodyAcc-std()-X"                    
[77] "270 fBodyAcc-std()-Y"                     "271 fBodyAcc-std()-Z"                    
[79] "348 fBodyAccJerk-std()-X"                 "349 fBodyAccJerk-std()-Y"                
[81] "350 fBodyAccJerk-std()-Z"                 "427 fBodyGyro-std()-X"                   
[83] "428 fBodyGyro-std()-Y"                    "429 fBodyGyro-std()-Z"                   
[85] "504 fBodyAccMag-std()"                    "517 fBodyBodyAccJerkMag-std()"           
[87] "530 fBodyBodyGyroMag-std()"               "543 fBodyBodyGyroJerkMag-std()"          
> 