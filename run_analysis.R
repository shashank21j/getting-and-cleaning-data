library(plyr)

#Initializing 
#reading all data into variables
X_train <- read.table("UCI/train/X_train.txt")
y_train <- read.table("UCI/train/y_train.txt")
subject_train <- read.table("UCI/train/subject_train.txt")
X_test <- read.table("UCI/test/X_test.txt")
y_test <- read.table("UCI/test/y_test.txt")
subject_test <- read.table("UCI/test/subject_test.txt")
features <- read.table("UCI/features.txt")
activities <- read.table("UCI/activity_labels.txt")

# 1. Merges the training and the test sets to create one data set.
Xmerge <- rbind(X_train, X_test)
ymerge <- rbind(y_train, y_test)
subjectmerge <- rbind(subject_train, subject_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# we grep find columns with mean() / std() in their names and subset
mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])
Xmerge <- Xmerge[, mean_and_std]

# correct the column names from features
names(Xmerge) <- features[mean_and_std, 2]

# 3. Uses descriptive activity names to name the activities in the data set

ymerge[, 1] <- activities[ymerge[, 1], 2]
names(ymerge) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names. 
names(subjectmerge) <- "subject"
data <- cbind(Xmerge, ymerge, subjectmerge)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

averages_data <- ddply(data, c("subject","activity"), numcolwise(mean))

write.table(averages_data, "tidy_average_data.txt", row.name=FALSE)