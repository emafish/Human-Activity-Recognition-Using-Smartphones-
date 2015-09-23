library(data.table)
library(dplyr)

## This function produce a datafile HumanActivityRecognitionUsingSmartphones.csv
## containing only means and standard deviations

meansNstds <- function(){

  ## Get the field names out of features.txt
  feature <- fread("features.txt")
  ## feature$V2 contains all the descriptive names
  
  ## Retrieve only the names containing mean or std
  meansNstds <- filter(feature, grep("mean|std", V2))$V1
  
  ## Extract the columns containing "mean" or "std" from the main datafile
  test_data <- read.table("test/X_test.txt", 
                          colClasses = "numeric", 
                          col.names = feature$V2)[meansNstds]
  
  train_data <- read.table("train/X_train.txt", 
                           colClasses = "numeric", 
                           col.names = feature$V2)[meansNstds]
  
  ## Each Activity
  labels <- read.table("activity_labels.txt", 
                       col.names = c("activity_id", "activity"))
  label_test <- read.table("test/y_test.txt", 
                           col.names = "activity_id")
  label_train <- read.table("train/y_train.txt",
                            col.names = "activity_id")
  ## labels$V2 contains the activity names
  
  ## Each Subject
  subject_test <- read.table("test/subject_test.txt", col.names = "id")
  subject_train <- read.table("train/subject_train.txt", col.names = "id")
  
  ## nrow(unique(subject_train)) + nrow(unique(subject_test)) = 30
  ## It matches the number of participants
  
  ## Bind subject_test and test_data first (bind_cols)
  ## Then subject_train and train_data
  ## Finally bind the two sets together (bind_rows)
  test <- bind_cols(subject_test, test_data) %>%
          bind_cols(label_test)
  train <- bind_cols(subject_train, train_data) %>%
            bind_cols(label_train)
  AllSubjects <- bind_rows(test, train)
  
  ## write the datatable AllSubjects to 
  ## HumanActivityRecognitionUsingSmartphones.csv
  write.csv(AllSubjects, "HumanActivityRecognitionUsingSmartphones.csv")
}

## Average of each variable for each activity and each subject


