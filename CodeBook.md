This code book describes the variables in the data, the data and the work performed to clean up the data.

## Initial Steps
***

As per the submission instructions, the script can be run as long as the Samsung data is in the working directory.

For ease of use, the data was downloaded from the URL provided in the assignment instructions and unzipped. The data is contained in the original file called "UCI HAR Dataset".

## Prerequisites
***

As outlined in the README, the script utilises the dplyr and reshape2 packages. These should be installed prior to running the script using the below commands:

```{r}
install.packages("dplyr")
install.packages("reshape2")
```
The packages are loaded into R within the script so it is not necessary to load them before running it.

## Work Performed to Clean and Transform Data
***
Commentary is provided within the script for each step that is performed to result in the final independent tidy data set. These steps include:  

##### *1. Read data sets into R, and merge the test and training data sets to create one data set.*

The relevant data sets are read into R, and the test and training data sets are merged together to create one data set.  

##### *2. Label the data set with variable names provided in the features data set for ease of reference.*

To make the clean-up process easier, the variables are names based on the features data set.  

##### *3. Extract only the measurements on the mean and standard deviation for each measurement using the dplyr package.*

Only the measurements on the mean and standard deviation are extracted. Based on the review of the initial data's README file, the meanfreq() measurements have been excluded as they are not specifically mean measurements.

The dplyr package is used to select only the relevant columns.  

##### *4. Use descriptive activity names to name the activities in the data set.*

The descriptive activity names are contained within the label data set. The data set is read into R and merged with our data set to give the descriptive activity names.

The "_" has been removed and the first letters capitalised to make the activity names easier to read in accordance with tidy data principles.  

##### *5. Label the data set with descriptive variable names in accordance with tidy data principles.*

The descriptive variable names are included in the features data set and have already been added to the dataset in Step 2. 

However the names have been adjusted to adhere to tidy data principles, including:

    1. Removing the duplicate "body" included in some variables names as an error in the initial data set.
    2. Removing "()" from the variable names
    3. Removing "-" from the variable names
    4. Adjusting "t" to "Time" to make the names more descriptive
    5. Adjusting "f" to "Freq" to make the names more descriptive
      
##### *6. Create a second, independent tidy dataset with the average of each variable for each activity and each subject.*

The dataset has been summarised to provide the average of each variable for each activity and each subject. The reshape 2 package has been used to summarise the data.  

## Variables

There are 68 variables in the tidy data set. 

Variable Name | Unit | Description
------------- | ---- | -----------
activity | character variable | Describes the activity that was being performed by the subject. There are six activities in the data set.
subject | character variable | Identifies the subject who performed the activity, ranging from 1 to 30.
remaining variables | Hertz | Further explanation regarding the remaining variables is split out in the following tables.

The remaining variable names have substantially common parts, therefore I have summarised the relevant parts in the below table to make it easier to understand. For example, one variable is FreqBodyAccJerkmeanX which can be identified in the table below as the average of the frequency of the jerk of the body's acceleration performed in the x-axis direction. 

Variable Name | Description
---|---
Freq |  frequency 
Time |  time 
Body |      body movement 
Gravity |       applicable gravity 
AccJerk | Jerk of the acceleration
AccMag | Magnitude of the acceleration
Acc | acceleration
AccJerkMag | Magnitude of the jerk of the acceleration
GyroJerkMag | Magnitude of the jerk of the gyroscopical movement
GyroJerk | Jerk of the gyroscopical movement
GyroMag | Magnitude of the gyroscopical movement
Gyro | gyroscopical movement
mean | mean (average) value
std | standard deviation
X | movement performed in the x-axis direction
Y | movement performed in the y-axis direction
Z | movement performed in the z-axis direction

