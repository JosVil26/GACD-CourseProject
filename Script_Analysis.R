rm(list = ls())
library(reshape2)

# 1. Merges the training and the test sets to create one data set.
# Load the files in data.frames
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train <- cbind(subject_train, y_train, x_train)

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test <- cbind(subject_test, y_test, x_test)
final_data <- rbind(train, test)

features <- read.table("./UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# 2. Extracts only the measurements on the mean and standard deviation for each 
# measurement.
mean_std_features <- grep("-(mean|std)\\(\\)", features[,2])
filter_final <- c(1, 2, mean_std_features + 2)
final_data <- final_data[, filter_final]

# 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])
mean_std_features.names <- features[mean_std_features,2]
mean_std_features.names = gsub('-mean', 'Mean', mean_std_features.names)
mean_std_features.names = gsub('-std', 'Std', mean_std_features.names)
mean_std_features.names <- gsub('[-()]', '', mean_std_features.names)

# 4. Appropriately labels the data set with descriptive variable names.
colnames(final_data) <- c("Subject", "Activity", mean_std_features.names)

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
final_data$Activity <- factor(final_data$Activity, levels = activity_labels[,1], 
                              labels = activity_labels[,2])
final_data$Subject <- as.factor(final_data$Subject)

final_data.melted <- melt(final_data, id = c("Subject", "Activity"))
final_data.mean <- dcast(final_data.melted, Subject + Activity ~ variable, mean)

write.table(final_data.mean, "Tidy_Data.txt", row.names = FALSE, quote = FALSE)
