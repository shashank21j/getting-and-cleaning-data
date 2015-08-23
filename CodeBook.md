###Description of script  
the script run_analysis.R is supposed to perform 5 operations as given in project description.  

1. Merges the training and the test sets to create one data set.
Here we load the csv into R and combine the training and test files. 
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
We do a grep find on mean and std and filter those column in our data.  
3. Uses descriptive activity names to name the activities in the data set  
We use the activity labels and use that to replace values in ymerge data.  
4. Appropriately labels the data set with descriptive variable names. 
We label our activity and subject.  
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Here we use ddply() from plyr package to apply mean function on each.  

###Variables  
`X_train`, `X_test`, `Xmerge` contain training, test and merged set of test data repectively .   
`y_train`, `y_test`, `ymerge` contain training, test and merged set of test label data repectively.   
`subject_train`, `subject_test`, `subjectmerge` contain training, test and merged set of subject data.  
We use `rbind()` to merge rows.  
`features` contain the colnames for our test data. We use this to tidy up our data.  
`activities` contain the activity names for our tests.  
We rename the subject and activity columns before combining them.  
we merge all `data` together using `cbind()` and apply `ddply()` function to split the dataframe on subject and activity variable. We have 30 subjects and 6 activities and hence the final data contains 180 rows of mean values across all tests.  
In the end the tidy data is saved as txt in a file named `tidy_average_data.txt`

