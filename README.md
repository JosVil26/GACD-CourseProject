# Getting and Cleaning Data - Course Project

This is the course project for the Getting and Cleaning Data Coursera course.
Pre-requisites:
Download the dataset if it does not already exist in the working directory

The R script, `run_analysis.R`, does the following:
1. Clean the working directory.
2. Load the training, test and subject datasets, merges those
   datasets in an unique dataset.
3. Load the feature data.
4. Filter only those columns which reflect a mean or standard deviation 
   features in 2.
5. Loads the activity data for the dataset.
6. Format and clean the features names.
6. Assign the features names as columns labels to the dataset.
7. Creates a tidy dataset that consists of the average (mean) value of each
   variable for each subject and activity pair.

The end result is shown in the file `Tidy_Data.txt`.
