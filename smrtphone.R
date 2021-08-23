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

df_by_subject <- split(red_sub_test, red_sub_test$subject) 

# initialize empty data frames for loop processing

# act_means - holds column means for 1 activity and 1 subject.
act_means <- as_tibble(NULL)

# sub_means <- vector adding subject identity to the act_means vector
sub_means <- as_tibble(NULL)

# mean_df - holds new data frame with each subjects processed data grouped by activity
means_df <- as_tibble(NULL)

# loop to break out each subject's data for processing

for(sub in df_by_subject) {
    
    # separate all variables by activity into a list
    df_by_activity_list <- split(sub, sub$activity)
    
    # loop to analyze each activity and get the means for all variables. Store in act_mean
    for(act in df_by_activity_list) {
        act_mean <- colMeans(act[3:88])
        
        # add back activity variable to act_mean
        act_mean <- append(act[1,1], act_mean)
        
        # accumulate act_mean data in act_means
        act_means <- bind_rows(act_means,act_mean)
        
    }
    
    # add subject variable to act_means and store in sub_means
    sub_means <- append(sub[1,2], act_means)
    
    # store all sub_means rows into means_df
    means_df <- bind_rows(means_df, sub_means)
    
    
    
}
