
if(!file.exists("./Data")){dir.create("./Data")}         						
## creates Data directory within working directory if not already in existence

if(!file.exists("./Data/SamGalS.zip")) 
## downloads and unzips file within Data directory if not already in existence        
        
        {
        fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 	
        ## Windows 7 operating systmen; removed 's' in 'https' for download


        download.file(fileUrl, destfile = "./Data/SamGalS.zip")							
        ## downloads file into Data directory, names file SamGalS.zip

        unzip("./Data/SamGalS.zip", exdir = "./Data")								
        ## unzips SamGalS.zip file into Data directory
        }

dftraindata <- read.table("./Data/UCI HAR Dataset/train/X_train.txt")					
## reads training data into dftraindata data frame

dftrainlabels <- read.table("./Data/UCI HAR Dataset/train/y_train.txt")					
## reads training labels into dftrainlabels data frame

dftrainsub <- read.table("./Data/UCI HAR Dataset/train/subject_train.txt")
## reads train subjects into dftestsub data frame

dftestdata <- read.table("./Data/UCI HAR Dataset/test/X_test.txt")
## reads test data into dftestdata data frame

dftestlabels <- read.table("./Data/UCI HAR Dataset/test/y_test.txt")
## reads test labels into dftestlabels data frame

dftestsub <- read.table("./Data/UCI HAR Dataset/test/subject_test.txt")
## reads test subjects into dftestsub data frame

dfactlabels <- read.table("./Data/UCI HAR Dataset/activity_labels.txt")					
## reads activity labels into dfactlabels data frame

names(dfactlabels) <- c("labels", "activity")
## renames dfactlabels columns to labels and activity

dffeatures <- read.table("./Data/UCI HAR Dataset/features.txt")
## reads features into dffeatures data frame

dffeatures[,3] <- as.character(dffeatures[,2])
## creates new third column in dffeatures as character class of column two

featuresv <- as.vector(dffeatures[,3])
## reads feature names from column three of dffeatures data frame into a vector

dftraindata$labels <- dftrainlabels[, 1] 
## reads training labels into dftraindata  data frame, column "labels"

dftestdata$labels <- dftestlabels[, 1]
## reads test labels into dftestdata  data frame, column "labels" 

dftraindata$subject <- dftrainsub$V1
## reads subjects into dftraindata  data frame, column "subject"

dftestdata$subject <- dftestsub$V1
## reads subjects into dftestdata  data frame, column "subject"

dftraindata$dataset <- rep("train")
## reads repeated word 'train' into dftraindata  data frame, column "dataset"

dftestdata$dataset <- rep("test")
## reads repeated word 'test' into dftestdata  data frame, column "dataset"

dfrbind <- rbind(dftraindata, dftestdata)
## *** 1.Merges the training and the test sets to create one data set. ***

dfmerge <- merge(dfrbind, dfactlabels, by.x = "labels", by.y = "labels")
## creates dfmerge data frame which is the the merge of dfrbind and dfactlabels by the column "labels"
## *** 3.Uses descriptive activity names to name the activities in the data set. ***

names(dfmerge) <- c("labels", featuresv[1:561], "subject", "dataset", "activity")
## reads in the names for the 2:562 columns of dfmerge from the featuresv vector
## *** 4.Appropriately labels the data set with descriptive variable names. ***


dffinal1 <- dfmerge[,c(564, 1, 565, 563, grep("mean()", names(dfmerge)))]
## creates dffinal1 data frame from selected columns from dfmerge using grep function

dffinal2 <- dfmerge[,grep("std()", names(dfmerge))]
## creates dffinal2 data frame from selected columns from dfmerge using grep function

dffinal3 <- cbind(dffinal1[, 1:50],dffinal2[,1:33])
## creates dffinal3 data frame from column binding dffinal1 and dffinal2

dffinal <- dffinal3[, -grep("meanFreq()", names(dffinal3))]
## creates dffinal data frame by removing selecting columns from dffinal3 using grep function
## *** 2.Extracts only the measurements on the mean and standard deviation for each measurement. ***

## BELOW *** 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. ***

dftidy1 <- data.frame()
## creates empty data frame dftidy1

for (i in 5:70) { ## enters mean by activity label of each measure in dffinal into dftidy1
        
        dat <- tapply(dffinal[,i],dffinal$labels,mean)
        dftidy1 <- rbind(dftidy1,dat)
        i <- i + 1
}

namerows <- as.character(names(dffinal[,c(5:70)]))
namecols <- as.character(dfactlabels$activity)
colnames(dftidy1) <- namecols
dftidy1$measurement <- namerows

## names columns and rows of dftidy1

dftidy2 <- data.frame()
## creates empty data frame dftidy2

for (i in 5:70) { ## enters mean by subject of each measure in dffinal into dftidy2
        
        dat <- tapply(dffinal[,i],dffinal$subject,mean)
        dftidy2 <- rbind(dftidy2,dat)
        i <- i + 1
}

namerows <- as.character(names(dffinal[,c(5:70)]))
namecols <- as.character(sort(unique(dffinal$subject)))
colnames(dftidy2) <- namecols
dftidy2$measurement <- namerows
## names columns and rows of dftidy1

dftidy <- merge(dftidy1, dftidy2, by.x = "measurement", by.y = "measurement")
## creates dftidy data frame by merging dftidy1 and dftidy2 on measurement

