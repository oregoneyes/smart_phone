# smart_phone

The smrt_phone.R script reads in the smartphone data provided for the project. It combines the test and training data from all 30 test subjects. It modifies the activity vector to provide descriptive names. The original data set is subset to only include variable names with 'mean' and 'std' in their labels. This data set is red_sub_test.

The red_sub_test was analysed further. Individual sensors readings for each test subject doing a particular activity were grouped together and a mean was calculated. The means were aggregated together under the sensor variable for each subject and each activity in the final data set called means_df. 