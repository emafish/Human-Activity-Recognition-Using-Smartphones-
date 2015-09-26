# Human-Activity-Recognition-Using-Smartphones

You should create one R script called run_analysis.R that does the following. 
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The code run_analysis.R contains two functions:

1. run_analysis1() merges the training and the test sets to create one data set and perform all the requirement from step 1 through step 4.

2. run_analysis2() takes the dataset produced by run_analysis1() and creates a second independent tidy data set called "tidy.csv".


The CodeBook explains each fields in tidy data set "tidy.csv".
