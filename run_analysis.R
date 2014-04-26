# Getting and Cleaning Data Project 2014 April

# Data Source:
# Human Activity Recognition Using Smartphones Dataset Version 1.0
# * URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# * Date/Time of Download: 2014-04-23 6:30 UTC

# Program development environment:
# * R version 3.1.0
# * RStudio version 0.98.501
# * Operating System: Windows XP
# * Only Base R functions are used to avoid package difference in computer systems
# * Datasets are assumed to have been unzipped to R's working dirctory

# Use dataset's directory organization without change
dataDir <- "./UCI HAR Dataset"

# *** 1. Merge the training and the test sets to create one data set *** 

addVarToX <- function(dataGroup){
  # This function adds dataGroup, subject and activity variables to X file of measurements
  # dataGroup may be "test" or "train"
  # dataGroup is added because the source of data will not be clear after merging data files
  
  # Read subject file (subject_ file)
  subjectFile <- paste(dataDir, "/", dataGroup, "/", "subject_", dataGroup, ".txt", sep = "")
  subject <- read.table(subjectFile)  
  
  # Read activity file (y_ file)
  activityFile <- paste(dataDir, "/", dataGroup, "/", "y_", dataGroup, ".txt", sep = "")
  activity <- read.table(activityFile)
  
  # Read measurement file (X_ file)
  XFile <- paste(dataDir, "/", dataGroup, "/", "X_", dataGroup, ".txt", sep = "")
  X <- read.table(XFile)
  
  # Combine the above into one data frame
  cbind(I(dataGroup), subject, activity, X)
}

# Apply addVarToX to X_ files in the test and the train set
dataTest <- addVarToX("test")
dataTrain <- addVarToX("train")

# Merge test and train sets
# Since dataTest and dataTrain have the same structure and there are 564 columns,
# rbind() is much more efficient than merge()
dataAll <- rbind(dataTest, dataTrain)

# Get feature names from features.txt
featuresFile <- paste(dataDir, "/features.txt", sep = "")
features <- read.table(featuresFile)
featureNames <- as.vector(features[, 2])

# Assign column names to dataAll
colnames(dataAll) <- c("dataGroup", "subject", "activity", featureNames)

# Sort dataAll by subject and activity
dataAll <- dataAll[order(dataAll$subject, dataAll$activity), ]


# *** 2. Extract only the measurements on the mean and standard deviation for each measurement ***

# Create a logical vector to extract columns of mean and standard deviation measurements
# The first three columns dataGroup, subject and activity will also be extracted
extractVector <- rep(TRUE, 3)
for(i in 4:nrow(dataAll)){
  extractVector <- c(extractVector, grepl(".*[Mm]ean.*|.*std.*", colnames(dataAll)[i]))
}

# Extract the mean and standard deviation measurements
dataExtract <- dataAll[extractVector]


# *** 3. Use descriptive activity names to name the activities in the data set ***
# *** 4. Appropriately label the data set with descriptive activity names ***

# Get activity names from activity_labels.txt
activityFile <- paste(dataDir, "/activity_labels.txt", sep = "")
activityNames <- read.table(activityFile)

for(i in 1:nrow(dataExtract)){
  activityCode <- dataExtract[i, "activity"]
  dataExtract[i, "activity"] <- as.vector(activityNames[activityCode, 2])
}

# Write the 1st tidy data set to file in R's working directory
# File name: run_analysis_output1.txt
write.table(dataExtract, file = "run_analysis_output1.txt")

# *** 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject ***

# Create an empty data frame with the same structure as dataExtract
dataSummary <- dataExtract[FALSE,]

# Set row number of dataSummary
rownum <- 1

# Fill dataSummary with the required average data
for(i in 1:30){
  for(j in seq_along(as.vector(activityNames[, 2]))){
    dataE <- dataExtract[dataExtract$subject == i & dataExtract$activity == as.vector(activityNames[j, 2]),]
    dataSummary[rownum, 1:3] <- list(dataE[1,1], dataE[1, 2], dataE[1, 3])
    dataSummary[rownum, 4:ncol(dataE)] <- colMeans(dataE[4:ncol(dataE)])
    rownum <- rownum + 1
  }  
}

# Write the 2nd tidy data set to file in R's working directory
# File name: run_analysis_output2.txt
write.table(dataSummary, file = "run_analysis_output2.txt")
