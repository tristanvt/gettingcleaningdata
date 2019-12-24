# Getting and Cleaning Data Course Project Code Book
This file describes the variables in the script.


## Variables
* trainX = The training input features
* trainY = The training labels
* testX = The testing input features
* testY = The testing labels
* subjectTrain = The training subjects corresponding to the training obeservations
* subjectTest = The training subjects corresponding to the testing obeservations
* X = A concatenation of subjectTrain and subjectTest
* subjects = A concatenation of trainX and testX
* numY = A concatenation of trainY and testY (numeric)
* featureNames =  A dataframe linking column indices to names
* targetCols =  The indices and names of the columns that represent a mean or std
* activityLabels = A dataframe linking activity names to their numeric representation
* numY = A concatenation of trainY and testY (text representation)
* df =  The data frame as required by step 4
* tidy =  A table containing the mean for every variable grouped by activity and subject

