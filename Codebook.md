**This is a code book that describes the variables in the TidyData.txt.**

### The dataset includes the following files:

* 'README.txt'

* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

### There are 5 parts the project does:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.



### Names of Variables:

* [1] "timeBodyAccelerometer-mean()-X"                 "timeBodyAccelerometer-mean()-Y"                
* [3] "timeBodyAccelerometer-mean()-Z"                 "timeBodyAccelerometer-std()-X"                 
* [5] "timeBodyAccelerometer-std()-Y"                  "timeBodyAccelerometer-std()-Z"                 
* [7] "timeGravityAccelerometer-mean()-X"              "timeGravityAccelerometer-mean()-Y"             
* [9] "timeGravityAccelerometer-mean()-Z"              "timeGravityAccelerometer-std()-X"              
* [11] "timeGravityAccelerometer-std()-Y"               "timeGravityAccelerometer-std()-Z"              
* [13] "timeBodyAccelerometerJerk-mean()-X"             "timeBodyAccelerometerJerk-mean()-Y"            
* [15] "timeBodyAccelerometerJerk-mean()-Z"             "timeBodyAccelerometerJerk-std()-X"             
* [17] "timeBodyAccelerometerJerk-std()-Y"              "timeBodyAccelerometerJerk-std()-Z"             
* [19] "timeBodyGyroscope-mean()-X"                     "timeBodyGyroscope-mean()-Y"                    
* [21] "timeBodyGyroscope-mean()-Z"                     "timeBodyGyroscope-std()-X"                     
* [23] "timeBodyGyroscope-std()-Y"                      "timeBodyGyroscope-std()-Z"                     
* [25] "timeBodyGyroscopeJerk-mean()-X"                 "timeBodyGyroscopeJerk-mean()-Y"                
* [27] "timeBodyGyroscopeJerk-mean()-Z"                 "timeBodyGyroscopeJerk-std()-X"                 
* [29] "timeBodyGyroscopeJerk-std()-Y"                  "timeBodyGyroscopeJerk-std()-Z"                 
* [31] "timeBodyAccelerometerMagnitude-mean()"          "timeBodyAccelerometerMagnitude-std()"          
* [33] "timeGravityAccelerometerMagnitude-mean()"       "timeGravityAccelerometerMagnitude-std()"       
* [35] "timeBodyAccelerometerJerkMagnitude-mean()"      "timeBodyAccelerometerJerkMagnitude-std()"      
* [37] "timeBodyGyroscopeMagnitude-mean()"              "timeBodyGyroscopeMagnitude-std()"              
* [39] "timeBodyGyroscopeJerkMagnitude-mean()"          "timeBodyGyroscopeJerkMagnitude-std()"          
* [41] "frequencyBodyAccelerometer-mean()-X"            "frequencyBodyAccelerometer-mean()-Y"           
* [43] "frequencyBodyAccelerometer-mean()-Z"            "frequencyBodyAccelerometer-std()-X"            
* [45] "frequencyBodyAccelerometer-std()-Y"             "frequencyBodyAccelerometer-std()-Z"            
* [47] "frequencyBodyAccelerometerJerk-mean()-X"        "frequencyBodyAccelerometerJerk-mean()-Y"       
* [49] "frequencyBodyAccelerometerJerk-mean()-Z"        "frequencyBodyAccelerometerJerk-std()-X"        
* [51] "frequencyBodyAccelerometerJerk-std()-Y"         "frequencyBodyAccelerometerJerk-std()-Z"        
* [53] "frequencyBodyGyroscope-mean()-X"                "frequencyBodyGyroscope-mean()-Y"               
* [55] "frequencyBodyGyroscope-mean()-Z"                "frequencyBodyGyroscope-std()-X"                
* [57] "frequencyBodyGyroscope-std()-Y"                 "frequencyBodyGyroscope-std()-Z"                
* [59] "frequencyBodyAccelerometerMagnitude-mean()"     "frequencyBodyAccelerometerMagnitude-std()"     
* [61] "frequencyBodyAccelerometerJerkMagnitude-mean()" "frequencyBodyAccelerometerJerkMagnitude-std()" 
* [63] "frequencyBodyGyroscopeMagnitude-mean()"         "frequencyBodyGyroscopeMagnitude-std()"         
* [65] "frequencyBodyGyroscopeJerkMagnitude-mean()"     "frequencyBodyGyroscopeJerkMagnitude-std()"     
* [67] "activity"                                       "subject"           

### Activity Labels

* WALKING (Level 1): subject was walking during the test
* WALKING_UPSTAIRS (Level 2): subject was walking up a staircase during the test
* WALKING_DOWNSTAIRS (Level 3): subject was walking down a staircase during the test
* SITTING (Level 4): subject was sitting during the test
* STANDING (Level 5): subject was standing during the test
* LAYING (Level 6): subject was laying down during the test

