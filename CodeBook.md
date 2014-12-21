##Introduction
The script run_analysis.R performs the 5 steps described in the course project.

*First, all data with same definitions and number of columns are merged using the rbind() function. 

*Then, only those columns with the mean and standard deviation measures in their column names are taken from the whole dataset.

*After extracting these columns, they are given the descriptive names, taken from features.txt.

*The activity names and IDs from activity_labels.txt are substituted in the dataset.

*All column names are given descriptive names.

*Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to this repository.

##Variables

*x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.

*x_data, y_data and subject_data merge the previous datasets to further analysis.

*features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.

*A similar approach is taken with activity names through the activities variable.

*all_data merges x_data, y_data and subject_data in a big dataset.

*Finally, averages_data contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.