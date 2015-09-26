# Getting and Cleaning Data - Course Project

This is the course project for the Getting and Cleaning Data Coursera course.

Pre-requisites:

Download the dataset if it does not already exist in the working directory

The R script, `run_analysis.R`, does the following:
* Clean the working directory.
* Load the training, test and subject datasets, merges those datasets in an 
unique dataset.
* Load the feature data.
* Filter only those columns which reflect a mean or standard deviation features
in 2.
* Loads the activity data for the dataset.
* Format and clean the features names.
* Assign the features names as columns labels to the dataset.
* Creates a tidy dataset that consists of the average (mean) value of each 
variable for each subject and activity pair.

The end result is shown in the file `Tidy_Data.txt`.
