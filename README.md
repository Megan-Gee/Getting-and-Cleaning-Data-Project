The purpose of the run_analysis script is to collect, work with and clean the "Human Activity Recognition Using Smartphones" data set.

The final result of the script is the generation of a tidy data text file that meets the principles of tidy data, including:

    1. Each variable you measure should be in one column
    2. Each different observation of that variable should be in a different row
    3. There should be one table for each "kind" of variable

## Contents of Repository
***

The repository contains the following files:

File Name       | Description
--------------- | ------------
README.md       | Documentation explaining the project and how to use files contained in the repository
CodeBook.md     | Describes the data, variable names, descriptions and units
run_analysis.R  | Collects, works with the cleans the "Human Activity Recognition Using Smartphones" data set.
tidydata.txt    | Text file containing the independent tidy data set per Step 5 of the assignment.

## Initial Steps
***

As per the submission instructions, the script can be run as long as the Samsung data is in the working directory.

For ease of use, the data was downloaded from the URL provided in the assignment instructions and unzipped. The data is contained in the original file called "UCI HAR Dataset".

## Prerequisites
***

The script utilises the dplyr and reshape2 packages. These should be installed prior to running the script using the below commands:

```{r}
install.packages("dplyr")
install.packages("reshape2")
```
The packages are loaded into R within the script so it is not necessary to load them before running it.


## How it Works
***

As outlined above, the run-analysis script works to collect, clean and transport the provided dataset. It reads the relevant data sets into R, merges the data and applies descriptive activity and variable names. It then creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Further information outlining exactly how the script works to transform data is included in the CodeBook.

## Final Result and Explanation
***

The final result is a text file that contains the independent tidy data set. Further information regarding the process is explained in the CodeBook. 

As noted above, the final data set is tidy as it adheres to the principles of tidy data. The final set is in the long form of tidy data with 160 rows and 68 columns, showing the average of the mean and standard deviation of each movement performed for every activity and subject.

The activity names have been added based on the label data set, and adjusted to make it easier to understand by removing "_" and capitalising letters.

Descriptive variable names have been added based on the features data set. To make the descriptive variable names tidy, other characters such as "()" and "_" have been removed, and "t" and "f" have been updated to be the more descriptive terms "term" and "frequency". This makes the variable names easier to read and understand for anyone looking at the data set. To avoid making the variable names too long and hard to read, further details regarding each name have been provided in the codebook.

If you would like to look at the data set in R, use the following command:

```{r}
tidy_data <- read.table(file_path, header = TRUE)
View(tidy_data)
```