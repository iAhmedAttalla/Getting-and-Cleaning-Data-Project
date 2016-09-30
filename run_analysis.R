#Check if directory exists first or not!
if( !file.exists("./data")){
        dir.create("./data")
}

#Download and Open data
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./data/Dataset.zip")

#Unzip download file in the same dir called data
unzip("./data/Dataset.zip", exdir = "./data" )

#Check if data is download and unziped correctly or not.
#To do it, We should to list the files of data dir.
#Get the path of dataset after unziped and then store it to use later.
#Used 'recursive' parameter of list files FUN,
#To get all files and sub-files inside any dir of data dir.

path_dataset <- file.path("./data", "UCI HAR Dataset")
list.files(path_dataset, recursive = TRUE) 

#Before reading data, We should know what files of the data set is related to.

# After checking the README.txt file we conclude the following: 

# 1.Values of Varible Activity consist of data from “Y_train.txt” and “Y_test.txt”
# 2.values of Varible Subject consist of data from “subject_train.txt” and subject_test.txt"
# 3.Values of Varibles Features consist of data from “X_train.txt” and “X_test.txt”
# 4.Names of Varibles Features come from “features.txt”
# 5.levels of Varible Activity come from “activity_labels.txt”
#So we will use Activity, Subject and Features...
# as part of descriptive variable names for data in data frame.

#1. Merges the training and the test sets to create one data set.

#Read the Activity files
dataActivityTrain <- read.table(file.path(path_dataset,
                                          "train", "Y_train.txt"),header = FALSE)
dataActivityTest  <- read.table(file.path(path_dataset,
                                          "test" , "Y_test.txt" ),header = FALSE)
#Merge the Activity files
dataActivity <- rbind(dataActivityTrain, dataActivityTest)
#Name the variable to be activity. (Activity level)
names(dataActivity) <-  c("activity")


#Read the Subject files
dataSubjectTrain <- read.table(file.path(path_dataset,
                                         "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(path_dataset,
                                         "test" , "subject_test.txt"),header = FALSE)
#Merge the Subject files
dataSubject <- rbind( dataSubjectTrain, dataSubjectTest)
#Name the variable to be subject. (Subject level)
names(dataSubject) <- c("subject")


#Read Fearures files
dataFeaturesTrain <- read.table(file.path(path_dataset,
                                          "train", "X_train.txt"),header = FALSE)
dataFeaturesTest  <- read.table(file.path(path_dataset,
                                          "test" , "X_test.txt" ),header = FALSE)
#Merge the features files
dataFeatures <- rbind(dataFeaturesTrain, dataFeaturesTest)
#Read Activity_labels.txt to name the features data.
dataFeaturesNames <- read.table(file.path(path_dataset,
                                          "features.txt"),header= FALSE)
#Cuz the V2 is containing the whole names
names(dataFeatures) <- dataFeaturesNames$V2

#Bind all columnes to make the whole data which we want.
Data <- cbind(dataFeatures, dataSubject, dataActivity)
#str(Data)

#2. Extract the measurements on the mean and std in the dataset.

#by searching about it by searching names of variables
extractData <- dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)",
                                         dataFeaturesNames$V2)] #Regualar Expression
#Names that extracted before plus 'activity' and 'subject'
selected_from_extractData <- c(as.character(extractData), "activity", "subject")

#str(selected_from_extractData)
#head(selected_from_extractData)
#tail(selected_from_extractData)
#subset(Data, selected_from_extractData)
#str(Data <- Data[,selected_from_extractData])
Data <- Data[,selected_from_extractData]

#3. Uses descriptive activity names to name the activities in the data set

activityLabels <- read.table(file.path(path_dataset,
                                       "activity_labels.txt"),header = FALSE)
Data$activity <- factor(Data$activity, 
                        levels = activityLabels[,1], labels = activityLabels[,2])
head(Data$activity, 12)

#4. Appropriately labels the data set with descriptive variable names
head(names(Data))

#P.S: 
#prefix t is replaced by time
#Acc is replaced by Accelerometer
#Gyro is replaced by Gyroscope
#prefix f is replaced by frequency
#Mag is replaced by Magnitude
#BodyBody is replaced by Body

#Replacing by gsub function
names(Data) <- gsub("^t", "time", names(Data))
names(Data) <- gsub("^f", "frequency", names(Data))
names(Data) <- gsub("Acc", "Accelerometer", names(Data))
names(Data) <- gsub("Gyro", "Gyroscope", names(Data))
names(Data) <- gsub("Mag", "Magnitude", names(Data))
names(Data) <- gsub("BodyBody", "Body", names(Data))

head(names(Data), 16)

#5.(Tidy Data) From the data set in step 4, creates a second,
# independent tidy data set with the average of each variable 
# for each activity and each subject.

#Subject as a factor
Data$subject <- as.factor(Data$subject)
library(data.table)
Data <- data.table(Data)

#data set with average for each activity and subject.
Data <- aggregate(. ~subject + activity, Data, mean)
Data <- Data[order(Data$subject,Data$activity),]

#To write on text file inside project path called TidyData.txt
write.table(Data, "TidyData.txt", row.names = FALSE, quote = FALSE)
file.size("TidyData.txt") #Size of the output file in Bytes

