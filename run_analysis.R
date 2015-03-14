#Version 1.0
# Check README and Codebook files for details of the program and how to run it

run_analysis <- function(dataFolder=NULL) {
        fileSeparator <- .Platform$file.sep
        if (is.null(dataFolder)) {
                dataFolder <- paste(getwd(), fileSeparator, "UCI HAR Dataset", sep="")       
        }
        if(!file.exists(dataFolder)) {
                stop("Invalid folder - Cannot access data files")
        }
        print("Setting up...")
        outputFile <- paste(getwd(), fileSeparator, "tidyData.txt", sep="")
        featuresFile <- paste(dataFolder, fileSeparator, "features.txt", sep="") #"./features.txt"
        testFile <- paste(dataFolder, fileSeparator, "test", fileSeparator, 
                          "X_test.txt", sep="") #"./test/X_test.txt"
        testLabelFile <- paste(dataFolder, fileSeparator, "test", fileSeparator, "y_test.txt", 
                               sep="") #"./test/y_test.txt"
        testSubjectFile <- paste(dataFolder, fileSeparator, "test", fileSeparator, 
                                 "subject_test.txt", sep="") #"./test/subject_test.txt"
        trainFile <- paste(dataFolder, fileSeparator, "train", fileSeparator, 
                           "X_train.txt", sep="") #"./train/X_train.txt"
        trainLabelFile <- paste(dataFolder, fileSeparator, "train", fileSeparator, 
                                "y_train.txt", sep="") #"./train/y_train.txt"
        trainSubjectFile <- paste(dataFolder, fileSeparator, "train", fileSeparator, 
                                  "subject_train.txt", sep="") #"./train/subject_train.txt"
        activityLabelFile <- paste(dataFolder, fileSeparator, "activity_labels.txt", sep="") #"activity_labels.txt"
        filesList <- list(featuresFile, testFile, testLabelFile, testSubjectFile, trainFile, 
                          trainLabelFile, trainSubjectFile, activityLabelFile)
        names(filesList) <- c("featuresFile", "testFile", "testLabelFile", "testSubjectFile", "trainFile", 
                             "trainLabelFile", "trainSubjectFile", "activityLabelFile")
        data <- getCleanTidyData(filesList)
        print("Creating tidy output...")
        tidyOutput <<- createTidyOutput(data, outputFile)
}

getCleanTidyData <- function(filesList) {
        #Load test data
        print("Getting test data...")
        testData <- readFile(filesList$testFile)
        #Load training data
        print("Getting train data...")
        trainData <- readFile(filesList$trainFile)
        #Load training labels
        print("Getting label data...")
        trainLabelData <- readFile(filesList$trainLabelFile)
        #Load test labels
        testLabelData <- readFile(filesList$testLabelFile)
        #Load test subject data
        print("Getting subject data...")
        testSubjectData <- readFile(filesList$testSubjectFile)
        #Load train subject data
        trainSubjectData <- readFile(filesList$trainSubjectFile)
        #Load acticity labels
        print("Getting activity data...")
        activityLabelData <- readFile(filesList$activityLabelFile)
        #Load feature names
        print("Getting and cleaning feature names...")
        featureNamesData <- readFile(filesList$featuresFile)
        featureNames <- getCleanFeatureNames(featureNamesData)
        #write.table(featureNames, "featureNames.txt", sep=" ", row.names=FALSE, quote=FALSE)
        print("Binding up the data...")
        allData <- getTidyData(testData, trainData, testLabelData, trainLabelData, 
                               testSubjectData, trainSubjectData, featureNames)
        print("Extracting mean and stdev features...")
        allData <- getMeanAndStdevFeatures(allData)
        print("Tidying up data...")
        allData <- tidyUpActivityData(allData, activityLabelData)
}

readFile <- function(fileName=NULL) {
        if(is.null(fileName) || !file.exists(fileName)) stop(paste(fileName, "file does not exist"))
        #Load test data
        data <- read.table(fileName, header=FALSE)
}

getCleanFeatureNames <- function(featureNamesData) {
        # Change feature names to more clear ones
        featureNames <- make.names(featureNamesData[, 2])
        featureNames <- getReadableFeatureNames(featureNames)
        featureNames <- c(featureNames, "activity", "subject")
}

getReadableFeatureNames <- function(featureNames) {
        featureNames <- gsub("\\.", "", featureNames)
        featureNames <- sub("^t", "time.", featureNames)
        featureNames <- sub("^f", "frequency.", featureNames)
        featureNames <- gsub("[Bb]ody", "body.", featureNames)
        featureNames <- sub("tbody", "time.body", featureNames)
        featureNames <- gsub("[Gg]yro", "Gyro.", featureNames)
        featureNames <- gsub("[Jj]erk", "jerk.", featureNames)
        featureNames <- gsub("[Aa]ngle", "angle.", featureNames)
        featureNames <- gsub("[Gg]ravity", "gravity.", featureNames)
        featureNames <- gsub("[Ss]td", "stdev.", featureNames)
        featureNames <- gsub("[Mm]ean", "mean.", featureNames)
        featureNames <- gsub("Acc", "Acc.", featureNames)
        featureNames <- gsub("X$", "Xaxis", featureNames)
        featureNames <- gsub("Y$", "Yaxis", featureNames)
        featureNames <- gsub("Z$", "Zaxis", featureNames)
        featureNames <- gsub("Xgravity", "Xaxis.gravity", featureNames)
        featureNames <- gsub("Ygravity", "Yaxis.gravity", featureNames)
        featureNames <- gsub("Zgravity", "Zaxis.gravity", featureNames)
        featureNames <- gsub("Mag", "mag.", featureNames)
        featureNames <- gsub("Freq", "freq.", featureNames)
        featureNames <- sub("\\.$", "", featureNames)
        featureNames
}

getTidyData <- function(testData, trainData, testLabelData, trainLabelData, testSubjectData, trainSubjectData, featureNames) {
        # add colomn with label data
        testData <- cbind(testData, testLabelData)
        trainData <- cbind(trainData, trainLabelData)
        # add colomn with subject data
        testData <- cbind(testData, testSubjectData)
        trainData <- cbind(trainData, trainSubjectData)
        #merge test and train data
        allData <- rbind(testData, trainData)
        #add feature names to the combined data
        names(allData) <- featureNames
        allData
}

getMeanAndStdevFeatures <- function(allData) {
        #Extract columns which have mean and std deviations
        reqCols <- grep("mean", tolower(names(allData)))
        reqCols <- unique(c(reqCols, grep("std", tolower(names(allData))))) #alternatively use select(data, contains())
        reqCols <- sort(reqCols)
        # add the activity.code and subject colomns
        reqCols <- c(reqCols, 562, 563)
        #Extract mean and std deviation data
        reqData <- allData[,reqCols]
}

tidyUpActivityData <- function(allData, activityLabelData) {
        allData$activity <- as.factor(allData$activity)
        names(activityLabelData) <- c("activity.code", "activity.label")
        #New colomn with activity labels
        allData$activity <- factor(allData$activity, 
                                         levels=activityLabelData$activity.code, 
                                         labels=activityLabelData$activity.label)
        allData
}

createTidyOutput <- function(data, outputFile) {
        tidyData <- aggregate(subset(data, select= -c(activity, subject)), 
                               by = list( data$activity, data$subject), FUN = mean)
        names(tidyData)[names(tidyData) == "Group.1"] <- "activity.label"
        names(tidyData)[names(tidyData) == "Group.2"] <- "subject"
        print(paste("Writing tidy data output to", outputFile))
        write.table(tidyData, outputFile, row.names=FALSE, sep=" ", quote=FALSE)
        tidyData
}