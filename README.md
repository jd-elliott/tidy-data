# Getting and Cleaning Data - Course Project
## Written by J.D. Elliott

This repository includes a single R script, run_analysis.R, built to meet the
requirements of the course project in the "Getting and Cleaning Data" course in the Data Science curriculum offered by Johns Hopkins University via Coursera.  The repository also includes a single dataset, tidy.txt, containing the summarized output produced from run_analysis.R.

The script is designed to read various data files from the "Human Activity Recognition Using Smartphones Dataset," combine the file partitions and collapse the test and training portions of the dataset.  The script also applies descriptive names to each of the dataset's columns as provided in the master dataset.  Next, the data is subset to include only the mean and standard deviation related columns for each subject and activity.  Finally, the dataset is summarized to provide an average value for each measure by subject and activity and the output is written to the tidy.txt file.

Before executing the script, it is necessary to manually download the source dataset from the link below.  The zip file should be unarchived into the /data subfolder within the target working directory.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
