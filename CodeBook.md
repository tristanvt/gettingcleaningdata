# Getting and Cleaning Data Course Project Code Book
This file explains the run_analysis.R script and all the transformations done there to convert the given data to a usable format.

## Loading in the data
The train and test sets are split into two folders. Each folder contains multiple files that are of interest. X_train.txt contains the input features, y_train.txt contains the activity labels corresponding to these input features. These are represented by numbers from 1-6. The subject_train.txt file contains the number representing the subject conducting the experiment. For the test data, there are the same files.




Then there are two files that are used to transform the numeric labels to their text representation. These files are: features.txt containing the column names of the input features and activity_labels.txt containing the text representation of an activity linked to it's numeric representation.


All these files are loaded in as they will be used later on. The X and y datasets from both test and train are concatenated with each other using the rbind function. The same is done for the subjects.

## Selecting only mean and std columns
The data frame called featureNames contains all feature names and their column index. To select only those that correspond to a mean or std, a grep function is used. This grep only returns those columns that contain either mean() or std().  

These indeces can then be used to select only those columns from the data frame. The column representing the feature name is used to name the columns in the resulting data frame.

## Descriptive activity names
As mentioned before, the descriptive activity names can be found in the activity_labels.txt file. This file links a number between 1 and 6 to it's textual representation. A left join is used together with a select to first link the subject dataframe with the textual representation and then drop the numerical one.

This data frame is then joined to the rest of the data and the subject names using the cbind function.

## Label the data set
The variable names were taken from the features.txt file as mentioned before.

## Creating a tidy summary dataset
The previous dataset was already tidy. Every row represented one observation (sensor reading). Every column represents one variable. To create the required dataset, the previous one is first grouped by activity and subject and after that the summary_all function is used to calculate the mean for each activity and subject.

Each row now corresponds to average sensor readings for one activity for a specific subject.

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

