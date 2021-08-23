
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
#}