#
# This script is for the Class Project for the Getting and Cleaning Data 
# course in the Coursera Data Scientist track
#
# This script should be run from the "UCI HAR Dataset" directory after
# the data file is unzipped
#
# First load the dplyr library for use in the summarize_each step at the end
#
# Next load the features file in as a table.  This will give us our column names 
# later
# 
# Load in the rows for the training data set and assign the column names
#
# Now load in the Activity numerical values, these will be decoded later
#
# Now load in the subject ids
#
# Repeat the steps above for the Test data
#
# Join the Test and Train data frames together
#
# Create a new data frame that contains only the Subject, Activity columns 
# along with any columns that get a mean or std
#
# Remove the meanFreq columns
#
# Replace the numeric Activity labels with descriptive labels
#
# Group the data frame by the Subject and Activity, then
# get an average for each measurement column for each 
# Subject/Activity combination
#
# There will now be a data frame named MTStep5a.  This data frame will have 180
# rows, representing 6 rows per Subject, each of the 6 rows representing a
# different activity.
#
# For each of the 180 rows, there are 178 measurements, representing the mean or
# std for the measurements from a wearable monitor during a series of tests.
#

