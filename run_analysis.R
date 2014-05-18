setwd("F:/getting_data/assignments/UCI HAR Dataset")
library(plyr)

x_test <- read.table("./test/X_test.txt")
x_train <- read.table("./train/X_train.txt")
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")
names(x_test) <- features[,2]
names(x_train) <- features[,2]
names(activities) <- c("activity","activity_label")

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

df <- rbind(df_train,df_test)
# use rename function to rename columns to look better 
grep('mean|std',names(df),ignore.case = TRUE)
d <- df[c(1,2,grep('mean|std',names(df),ignore.case = TRUE))]

m <- merge(activities,d, all=TRUE)
