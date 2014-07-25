## Read UCI Accelerometer Data
actLab <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")
xTest <- read.table("./data/UCI HAR Dataset/test/x_test.txt")
yTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
xTrain <- read.table("./data/UCI HAR Dataset/train/x_train.txt")
yTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

## Label Columns
colnames(xTest) <- features$V2
colnames(yTest) <- c("activity")
colnames(xTrain) <- features$V2
colnames(yTrain) <- c("activity")
colnames(subTest) <- c("subject")
colnames(subTrain) <- c("subject")

## Bind Test and Train Datasets
testData <- cbind(subTest, yTest, xTest)
trainData <- cbind(subTrain, yTrain, xTrain)
data <- rbind(testData, trainData)

## Clean Up Intermediate Tables
rm (xTest, yTest, xTrain, yTrain, subTest, subTrain, testData, trainData)

## Label Activities
data$activity <- actLab$V2[match(data$activity, actLab$V1)]

## Subset Data to Include Only Mean and Std Dev Measures
data <- data[, c("subject", "activity",
                 names(data)[grep("mean|std", names(data))])]

## Summarize Data by Subject and Activity
library(reshape2)
md <- melt(data, id=(c("subject", "activity")))
tidy <- dcast(md, subject + activity ~ variable,
              fun.aggregate = mean, na.rm = TRUE)

## Write Tidy Dataset to File
write.table(tidy, file = "./tidy.txt")