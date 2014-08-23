README

In the script run_analysis.R, is needed to put inside the same directory the data UCI HAR Dataset to read the original data.
For example, if run_analysis is in directory d:\a, it must contain the folder "UCI HAR Dataset" that was uncompressed from the zip file downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script does the following actions (also commented in code):

1.- Reads all the files, and assign them to variables.
2.- Adds the activity column to the datasets (train and test).
3.- Adds the subject column to the datasets (train and test).
4.- Puts train and test dataset toguether in one single dataset.
5.- Names the columns (subject, activity and features).
6.- Changes the number values of activity for the names corresponding to each activity:
	1 WALKING
	2 WALKING_UPSTAIRS
	3 WALKING_DOWNSTAIRS
	4 SITTING
	5 STANDING
	6 LAYING
7.- Filters the mean and standard deviation columns.
8.- Renames the columns eliminating parenthesis "()" and changing "-" for "_" and everything in lowcase.
9.- Writes the file in tidyData.txt.
10.- Tests the file.


