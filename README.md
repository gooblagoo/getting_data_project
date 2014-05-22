Getting and Cleaning Data Course Project
=========================


### Script
run_analysis.R

### Data Loading
* Data was loaded from the UCI HAR Dataset. 
* All of the independent variables  (x_train and x_test) were read into a temporary data frame.
* The dependent variable (y_train and y_test) were loaded.
* The feature and activity_labels data was loaded into temporary data frames.
* The feature data was used to create the column names for the dependent variables


### Merging and Aggregation
* Merged the training and test datasets together
* Returned a tidy data set of the averages for each variable by activity and subject
* The aggregation resulted in 180 observations of the 86 variables

### Upload
Uploaded file tidy_data.txt as a comma delimited file




