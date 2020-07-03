## Read data sets into R, and merge the test and training data sets to create one
## data set. 

feature <- read.table("UCI HAR Dataset/features.txt")

test <- cbind(read.table("UCI HAR Dataset/test/subject_test.txt"),
              read.table("UCI HAR Dataset/test/y_test.txt"),
              read.table("UCI HAR Dataset/test/X_test.txt"))

train <- cbind(read.table("UCI HAR Dataset/train/subject_train.txt"),
               read.table("UCI HAR Dataset/train/y_train.txt"),
               read.table("UCI HAR Dataset/train/X_train.txt"))

data <- rbind(test, train)

## Label the data set with variable names provided in the features data set for 
## ease of reference.

feat <- as.character(feature$V2)
colnames(data) <- c("subject", "activity", feat)

## Extract only the measurements on the mean and standard deviation for each
## measurement using the dplyr package.

mean_std <- c("subject", "activity", grep("mean\\(\\)", feature$V2, value = TRUE), 
              grep("std\\(\\)", feature$V2, value = TRUE))

invisible(library(dplyr))
data_ms <- select(data, mean_std)

## Use descriptive activity names to name the activities in the data set.

label <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(label) <- c("number", "activity")

data_lms <- merge(label, data_ms, by.x = "number", by.y = "activity")
data_lmsa <- select(data_lms, -number)

data_lmsa[ ,1] <- as.character(data_lmsa[ ,1])
data_lmsa[ ,1] <- sub("_", " ", data_lmsa[ ,1])
data_lmsa[ ,1] <- gsub("(\\w)(\\w*)", "\\U\\1\\L\\2", data_lmsa[ ,1], perl = TRUE)

## Label the data set with descriptive variable names in accordance with the tidy
## data principles.

colnames(data_lmsa) <- sub("BodyBody", "Body", names(data_lmsa))
colnames(data_lmsa) <- gsub("\\(\\)", "", names(data_lmsa))
colnames(data_lmsa) <- gsub("-", "", names(data_lmsa))
colnames(data_lmsa) <- sub("^[t]", "Time", names(data_lmsa))
colnames(data_lmsa) <- sub("^[f]", "Freq", names(data_lmsa))

## Create a second, independent tidy dataset with the average of each variable
## for each activity and each subject.

library(reshape2)

varname <- names(data_lmsa[, 3:68])

data_f <- melt(data_lmsa, c("activity", "subject"), varname, na.rm = TRUE)
data_final <- dcast(data_f, activity + subject ~ varname, mean)

write.table(data_final, "tidydata.txt", row.names = FALSE)