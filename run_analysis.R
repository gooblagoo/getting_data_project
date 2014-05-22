# My two PCs like to map my USB drive with a different letter so check
#  directory existance and set working directory
if (file.exists("F:/getting_data/assignments/UCI HAR Dataset")){
    setwd("F:/getting_data/assignments/UCI HAR Dataset")
} else {
    setwd("E:/getting_data/assignments/UCI HAR Dataset")
}    

library(plyr)

# read in data and set column names to something readable
x_test <- read.table("./test/X_test.txt")
x_train <- read.table("./train/X_train.txt")
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")
names(x_test) <- features[,2]
names(x_train) <- features[,2]
names(activities) <- c("activity","activity_label")

# add subject and activity datasets
y_test <- read.table("./test/y_test.txt")
names(y_test) <- "activity"
y_train <- read.table("./train/y_train.txt")
names(y_train) <- "activity"
subject_test <- read.table("./test/subject_test.txt")
names(subject_test) <- "subject"
subject_train <- read.table("./train/subject_train.txt")
names(subject_train) <- "subject"
df_test <- cbind(subject_test,y_test,x_test)
df_train <- cbind(subject_train,y_train,x_train)

# combine train and test datasets
df <- rbind(df_train,df_test)

# subset the dataset to only include mean or standard deviation measures
d <- df[c(1,2,grep('mean|std',names(df),ignore.case = TRUE))]

m <- merge(activities,d, all=TRUE)

#check for missing data
sum(!(complete.cases(m)))

# change variable names based on Google R Style Guide
# https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml
names(m) <- gsub('^angle','angle.',names(m))
names(m) <- gsub('\\(|\\)','',names(m))
names(m) <- gsub('-|,','.',names(m))


# create new data set of mean for measures by activity
m.averages <- aggregate(m[,c(-1,-2,-3)],list(m$activity_label,m$subject),mean)
names(m.averages)[1] <- "activity"
names(m.averages)[2] <- "subject"

# save the aggregated tidy data to file
write.table(m.averages,file="F:/getting_data/assignments/course_project/tidy_data.txt",sep = ",")

