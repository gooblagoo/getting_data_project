Getting and Cleaning Data Course Project CodeBook
=========================

### Data Description

* There are 10,299 observations in the dataset
* There are no missing values
* Training and testing datasets were combined


#### Variable Descriptions


### Variable Transformations
* Changed variables names following the Google R Style Guide
  https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml
 * Removed parenthesis
 * Converted commas to periods
 * Converted dashes to periods
  
* The columns for the dataset were pruned so they only include mean and 
   standard deviation based measures. This was done by using grep to find 
   column names containing "mean" or "std" in their names.





### R
