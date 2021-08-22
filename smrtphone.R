library(tidyverse)
library(readr)

# read files in and store in appropriate variables.

# Load sensor readings for both training and testing.

x_sub <- read_table("C:/Users/Russell/projects/smart_phone/data/UCI HAR Dataset/train/X_train.txt",
                    col_names = F)
x_test <- read_table("C:/Users/Russell/projects/smart_phone/data/UCI HAR Dataset/test/X_test.txt",
                     col_names = F)

# Load activity variable during training 

activity_train <- read_table("C:/Users/Russell/projects/smart_phone/data/UCI HAR Dataset/train/y_train.txt",
                         col_names = F)

# Load activity variable during test.

activity_test <- read_table("C:/Users/Russell/projects/smart_phone/data/UCI HAR Dataset/test/y_test.txt",
                            col_names = F)

# Load subject variable during training

subject_train <- read_table("C:/Users/Russell/projects/smart_phone/data/UCI HAR Dataset/train/subject_train.txt",
                            col_names = F)

# Load subject variable during test

subject_test <- read_table("C:/Users/Russell/projects/smart_phone/data/UCI HAR Dataset/test/subject_test.txt",
                       col_names = F )

# read column names into colname variable

colname <- read_table("C:/Users/Russell/projects/smart_phone/data/UCI HAR Dataset/features.txt",
                      col_names = F)

# convert colname to vector x

x <- colname %>% pull

# create column names for x_sub and x_test using X

colnames(x_sub) <- x
colnames(x_test) <- x



# create activity vector with activity labels.

ac_vector <- c('walking', 'walking upstairs', 'walking downstairs', 'sitting',
               'standing', 'laying')

# replace activity_test & activity_train numbers with activity descriptive labels.

activity_test$X1 <- sapply(activity_test$X1, function(x) ac_vector[x])
activity_train$X1 <- sapply(activity_train$X1, function(x) ac_vector[x])

# join subject_test and subject_tran to x_sub and X_test

x_sub <- x_sub %>% mutate(subject = subject_train)
x_test <- x_test %>% mutate(subject = subject_test)
                          

# join activity_test and activity_train to x_sub and x_test

x_sub <- x_sub %>% mutate(activity = activity_train)
x_test <- x_test %>% mutate(activity = activity_test)

# merge rows of x_sub and x_test to combine data sets into sub_test

sub_test <- rbind(x_sub, x_test)

# select columns in sub_test activity and that contain 'mean' or 'std' for mean and standard deviation.
# store in red_sub_test

red_sub_test <- sub_test %>% select(activity, subject, contains(c('mean','std')))
red_sub_test$activity <- red_sub_test$activity$X1
red_sub_test$subject <- red_sub_test$subject$X1

#group_by activity and subject and summarize means

#means_df <- red_sub_test %>% group_by(activity, subject)

#means_df <- colMeans(means_df[3:88]) %>% summarise(activity, subject)   
    
