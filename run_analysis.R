setwd("D:\\courses\\r\\coursera 3 - data-cleaning\\assignment")

datasetFolder <- "UCI HAR Dataset"

#### Load the labels and features
# Load activity labels
labels <- read.table(paste(datasetFolder,"/activity_labels.txt",sep=""))
# Load features
features <- read.table(paste(datasetFolder,"/features.txt",sep=""))

#### Extract and rename mean and standard deviation for a more readable label
# Search inside features any feature which has 'mean' or 'std' in its label (column 2) 
featuresMeanAndStdList <- grep(".*mean.*|.*std.*", features[,2])
features <- features[featuresMeanAndStdList,2]
# Replaces '-mean' by 'Mean' 
features <- gsub('-mean', 'Mean', features)
# Replaces '-std' by 'Std' 
features <- gsub('-std', 'Std', features)

#### Load the datasets
# Load the training set
trainSet <- read.table(paste(datasetFolder,"/train/X_train.txt",sep=""))
trainSet <- train[featuresMeanAndStdList]
# Load the test set
testSet <- read.table(paste(datasetFolder,"/test/X_test.txt",sep=""))
testSet <- testSet[featuresMeanAndStdList]

# Load the training labels
trainLabels <- read.table(paste(datasetFolder,"/train/y_train.txt",sep=""))
# Load the test labels
testLabels <- read.table(paste(datasetFolder,"/test/y_test.txt",sep=""))

# Load the training subjects
trainSubjects <- read.table(paste(datasetFolder,"/train/subject_train.txt",sep=""))
# Load the test subjects
testSubjects <- read.table(paste(datasetFolder,"/test/subject_test.txt",sep=""))

# Links the subjects with the respective activity label and the training set
train <- cbind(trainSubjects, trainLabels, trainSet)
# Links the subjects with the respective activity label and the test set
test <- cbind(testSubjects, testLabels, testSet)

#### Merge (Item 1)
# merge train and test datasets and add features labels
dataset <- rbind(train, test)
# (Item 4)
colnames(dataset) <- c("Subject", "Activity", features)

#### Labels (Item 3)
# turn activities and replace the labels accordingly
dataset$Activity <- factor(dataset$Activity, levels = labels[,1], labels = labels[,2])
# turn subjects into factors
dataset$Subject <- as.factor(dataset$Subject)

#### Tidy new dataset (Item 5)
# Aggregate the mean value for each variable by its pair of subject and activity
library(stats)
means <- aggregate(as.matrix(dataset[,features]) ~ Subject + Activity, data = dataset, FUN= "mean" )
write.table(means, "tidy.txt", row.names = FALSE, quote = FALSE)
