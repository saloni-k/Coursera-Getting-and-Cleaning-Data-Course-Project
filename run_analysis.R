###### Step 1 ######
# Merge the training and test sets to create one data set

#train data
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

#test data
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

# create 'x' data set
x_data <- rbind(x_train, x_test)

# create 'y' data set
y_data <- rbind(y_train, y_test)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

###### Step 2 ######
# Extract only the measurements on the mean and standard deviation
# for each measurement

features <- read.table("features.txt")

# vector of column indices from features table with mean or std in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subsetting x_data to include only the above columns
x_data <- x_data[, mean_and_std_features]

# adding descriptive variable names
names(x_data) <- features[mean_and_std_features, 2]

###### Step 3 ######
# Use descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")

# rename observations with corresponding activity from activity_labels table
y_data[, 1] <- activities[y_data[, 1], 2]

# add a descriptive column name
names(y_data) <- "activity"

###### Step 4 ######
# Appropriately label the data set with descriptive variable names

# Few of the variables have been appropriately labeled in the previous steps

names(subject_data) <- "subject"

# combining the data
all_data <- cbind(subject_data, y_data, x_data)

###### Step 5 ######
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

library(plyr)

averages_data <- ddply(all_data, .(subject, activity), 
                       function(x) colMeans(x[,3:68]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)


