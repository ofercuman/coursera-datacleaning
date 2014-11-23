> dim(dftraindata)
[1] 7352  561
> dim(dftrainlabels)
[1] 7352    1
w/labels
> dim(dftraindata)
[1] 7352  562
w/subject and dataset
> dim(dftraindata)
[1] 7352  564


> dim(dftestdata)
[1] 2947  561
> dim(dftestlabels)
[1] 2947    1
w/labels
> dim(dftestdata)
[1] 2947  562
w/subject and dataset
> dim(dftestdata)
[1] 2947  564

> head(names(dftraindata))
[1] "V1" "V2" "V3" "V4" "V5" "V6"
> tail(names(dftraindata))
[1] "V559"    "V560"    "V561"    "labels"  "subject" "dataset"

> head(names(dftestdata))
[1] "V1" "V2" "V3" "V4" "V5" "V6"
> tail(names(dftestdata))
[1] "V559"    "V560"    "V561"    "labels"  "subject" "dataset"

> dim(dfrbind)
[1] 10299   564

> names(dfactlabels)
[1] "labels"   "activity"

> dim(dfmerge)
[1] 10299   565

> head(names(dfmerge))
[1] "labels"            "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z" "tBodyAcc-std()-X"  "tBodyAcc-std()-Y" 
> tail(names(dfmerge))
[1] "angle(X,gravityMean)" "angle(Y,gravityMean)" "angle(Z,gravityMean)" "subject"              "dataset"              "activity" 


> dim(dffinal1)
[1] 10299    50

> head(names(dffinal1),4)
[1] "dataset"  "labels"   "activity" "subject"

> length(grep("mean()", names(dfmerge)))
[1] 46


> dim(dffinal2)
[1] 10299    33

> length(grep("std()", names(dfmerge)))
[1] 33

> dim(dffinal3)
[1] 10299    83

> head(names(dffinal3),30)
[1] "dataset"                 "labels"                  "activity"                "subject"                 "tBodyAcc-mean()-X"       "tBodyAcc-mean()-Y"      
[7] "tBodyAcc-mean()-Z"       "tGravityAcc-mean()-X"    "tGravityAcc-mean()-Y"    "tGravityAcc-mean()-Z"    "tBodyAccJerk-mean()-X"   "tBodyAccJerk-mean()-Y"  
[13] "tBodyAccJerk-mean()-Z"   "tBodyGyro-mean()-X"      "tBodyGyro-mean()-Y"      "tBodyGyro-mean()-Z"      "tBodyGyroJerk-mean()-X"  "tBodyGyroJerk-mean()-Y" 
[19] "tBodyGyroJerk-mean()-Z"  "tBodyAccMag-mean()"      "tGravityAccMag-mean()"   "tBodyAccJerkMag-mean()"  "tBodyGyroMag-mean()"     "tBodyGyroJerkMag-mean()"
[25] "fBodyAcc-mean()-X"       "fBodyAcc-mean()-Y"       "fBodyAcc-mean()-Z"       "fBodyAcc-meanFreq()-X"   "fBodyAcc-meanFreq()-Y"   "fBodyAcc-meanFreq()-Z"

> dim(dffinal)
[1] 10299    70

> length(grep("meanFreq()", names(dfmerge)))
[1] 13

> dim(dftidy1)
[1] 66  7
> dim(dftidy2)
[1] 66 31
> dim(dftidy)
[1] 66 37
