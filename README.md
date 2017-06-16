# Getting-and-Cleaning-Data-Course-Project

## 

1. Read features/activity_label data
2. Read test data set.
* Appropriately labels the data set with descriptive variable names 
   using the `rename()` function.
* Names the activities in the data set using `cbind` and `merge()` functions.
3. Read train data set.
* Appropriately labels the data set with descriptive variable names 
   using the `rename()` function.
* Names the activities in the data set using `cbind` and `merge()` functions.
4. Merges the training and the test sets to create one data set using `rbind()` function.
5. Extracts only the measurements on the mean and standard deviation for each measurement
using the `grep()` function.
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject using the `group_by()` , `summarize_each()`, and `write_table()` functions.
