library(dplyr)

# Read in all the data
trainX <- read.table('./train/X_train.txt')
trainY <- read.table('./train/y_train.txt')
testX <- read.table('./test/X_test.txt')
testY <- read.table('./test/y_test.txt')
subjectTrain <- read.table('./train/subject_train.txt', col.names = c('Subject'))
subjectTest <- read.table('./test/subject_test.txt', col.names = c('Subject'))

# Combine train and test
X <- rbind(trainX, testX)
subjects <- rbind(subjectTrain, subjectTest)
numY <- rbind(trainY, testY)

# Find features that are mean/std
featureNames <- read.table('./features.txt')
targetCols <- filter(featureNames, grepl("mean\\(\\)|std\\(\\)", V2))

# Select only columns needed
X <- select(X, targetCols$V1)
colnames(X) <- targetCols$V2

# Get text activity labels
activityLabels <- read.table('./activity_labels.txt')
joined <- left_join(numY, activityLabels, by = c("V1", "V1"))
Y <- select(joined, V2)
colnames(Y) <- c("Activity")

# Combine all
df <- cbind(X, subjects, Y)

# Group by activity and subject and calculate mean of all variables
tidy <- group_by(df, Activity, Subject) %>%
  summarise_all(mean)
