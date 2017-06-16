rm(list = ls())

##### Read features, activity_label #####

actl <- read.table("./UCI HAR Dataset/activity_labels.txt")
ftr <- read.table("./UCI HAR Dataset/features.txt")

##### Read test data set 
##### & Uses descriptive activity names to name the activities in the data set(Criteria3).
##### & Appropriately labels the data set with descriptive variable names(Criteria4).

xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
xtest <- rename_(xtest,.dots=setNames(names(xtest),as.character(ftr[,2])))

ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")

sbtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
sbtest <- rename(sbtest, subject=V1)

test <- cbind(ytest,sbtest,xtest)
test <- actl %>% merge(test, by="V1",all=TRUE) %>%
        rename(label=V2)

##### Read training data set #####
##### & Uses descriptive activity names to name the activities in the data set.
##### & Appropriately labels the data set with descriptive variable names.

xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
xtrain <- rename_(xtrain,.dots=setNames(names(xtrain),as.character(ftr[,2])))

ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")

sbtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
sbtrain <- rename(sbtrain, subject=V1)

train <- cbind(ytrain,sbtrain,xtrain)
train <- actl %>% merge(train, by="V1",all=TRUE) %>% 
  rename(label=V2)

##### Merges the training and the test sets to create one data set(Criteria1). #####

merged <- rbind(train,test)

##### Extracts only the measurements on the mean  #####
##### and standard deviation for each measurement(Criteria2).  #####

merged_std_mn <- merged[,c(1,2,3,grep("mean\\(\\)|std\\(\\)",names(merged)))]


##### From the data set in step 4, 
##### creates a second, independent tidy data set with the average of 
##### each variable for each activity and each subject(Criteria5). #####
            
tidydata <- merged_std_mn %>% group_by(label,subject) %>%
            summarize_each(funs(mean)) %>% arrange(V1) %>% select(-V1)

write.table(tidydata, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
