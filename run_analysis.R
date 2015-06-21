# load the libraries needed for data manipulation
library(dplyr)
library(data.table)

# PREPARATION:
# Make sure that your working directory contains the 8 files (extracted from ZIP archive) 
# with Samsung data. These must be available and accessibe for the script to work properly.

# 1. features.txt
# 2. X_train.txt
# 3. X_test.txt
# 4. subject_test.txt
# 5. subject_train.txt
# 6. y_test.txt
# 7. y_train.txt
# 8. activity_labels.txt

## STEP 1
# In this step the 8 text files will be put together into a single data table.

# load data from the text files
t_features <- read.table("features.txt", header = FALSE)
t_x_train <- read.table("X_train.txt", header = FALSE)
t_x_test <- read.table("X_test.txt", header = FALSE)
t_subject_test <- read.table("subject_test.txt", header = FALSE)
t_subject_train <- read.table("subject_train.txt", header = FALSE)
t_y_test <- read.table("y_test.txt", header = FALSE)
t_y_train <- read.table("y_train.txt", header = FALSE)
t_activity_labels <- read.table("activity_labels.txt", header = FALSE)

# combine the train data
t_train <- cbind(t_x_train, t_subject_train, t_y_train)
# combine the test data
t_test <- cbind(t_x_test, t_subject_test, t_y_test)
# combine train and test data
t_data <- rbind(t_train, t_test)
# name the columns by transposing features table, taking second row as a vector with 
# 2 new columns: Subject and Activity
# in order to avoid duplicate column names make.unique function is used to eliminate those
names(t_data) <- make.unique(c(t(t_features)[2,], "Subject", "Activity"), sep = ".")

## STEP 2 (combined with STEP 4)
# In this step only the measurements for mean and standard deviation will be extracted
# The last 2 columns with Subject and Activity are also kept
t_data_ms <- select(t_data, contains("mean()"), contains("std()"), contains("Subject"), contains("Activity"))

## STEP 3
# In this step descriptive activity names will be added to the data table.
# This will be a new column following the Activity column

# Before column merging, give appropriate column names to the Activity table columns
names(t_activity_labels) <- c("Activity", "ActivityDesc")
# Now merge data and rearrange the columns
t_data_msa <- merge(t_data_ms, t_activity_labels, all=TRUE, by = c("Activity"))
t_data_msa <- t_data_msa[c(2:68, 69)]
names(t_data_msa)[68] <- "Activity"

## STEP 4 (see STEP 2 above)
# Columns names were given to the table as part of STEP 2 in order to make the 
# selection of the columns easier. At this point all the column names are 
# named descriptively and appropriately.

## STEP 5
# In this step the mean/average for all columns is calculated based on grouping by Subject and Activity.
# Since there are 30 subjects (people) and 6 activity types, the total number of rows is 30 x 6 = 180
t_data_clean <- t_data_msa %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

## CREATING AN OUTPUT "CLEAN" FILE
# In this step the contents of the "clean" data file are written to a physical text file.
write.table(t_data_clean, "tidy_data_set.txt", row.names = FALSE)

## CLEAN UP
# This steps removes all the environment variables created during the execution of the program.
remove("t_features", "t_x_train", "t_x_test", 
      "t_subject_test", "t_subject_train", "t_y_test", "t_y_train", "t_activity_labels",
      "t_train", "t_test", "t_data", "t_data_ms", "t_data_msa", "t_data_clean")
