# Getting-and-Cleaning-Data-Course-Project

The R scripts load Human Activity Recognition Using Smartphones Dataset
and create tidy data as below;

1. <b>Read features/activity_label data.</b>
2. <b>Read test data set.</b>
* Appropriately labels the data set with descriptive variable names 
   using the `rename()` function.
* Names the activities in the data set using `cbind` and `merge()` functions.
3. <b>Read train data set.</b>
* Appropriately labels the data set with descriptive variable names 
   using the `rename()` function.
* Names the activities in the data set using `cbind` and `merge()` functions.
4. <b>Merges the training and the test sets to create one data set using `rbind()` function.</b>
5. <b>Extracts only the measurements on the mean and standard deviation for each measurement
using the `grep()` function.</b>
6. <b>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject using the `group_by()` , `summarize_each()`, and `write_table()` functions.</b>
