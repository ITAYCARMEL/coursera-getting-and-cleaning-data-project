# Overview

The script `run_analysis.R` performs the 5 steps of Coursera's Getting and Cleaning Data Course Project. The steps were written in the following order:

* Step 1 - Extracts only the measurements on the mean and standard deviation for each measurement.
Activities labels and features are loaded first, then with regex only the features fields with 'mean' and 'std' in the name are extracted
`gsub()` is used to replace '-mean' and '-std' for a more readable name
* Step 2 - Merges the training and the test sets to create one data set.
After load the train and test datasets, they are merged in one whole dataset with the desired features (Mean and Std) with the respective subject and activity.
* Step 3 - Appropriately labels the data set with descriptive variable names.
After merge the dataset, labels with the respectives activities are applied to the dataset.
* Step 4 - Uses descriptive activity names to name the activities in the data set
Apply the features descriptive names using `colnames()` function.
* Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Using the function `aggregate`, a tidy dataset is written with the average of each variable (feature) with its pair of subject and activity

# Variables

* `labels`: dataset of activity labels
* `features`: dataset of features
* `featuresMeanAndStdList`: list of id from features which has 'mean' and 'std' in the name
* `trainSet`: dataset of train set filtered by the desired features
* `trainLabels`: label values from the train set
* `trainSubjects`: train subjects
* `train`: dataset with subjects, activities and train set
* `testSet`: dataset of test set filtered by the desired features
* `testLabels`: label values from the test set
* `testSubjects`: test subjects
* `test`: dataset with subjects, activities and test set
* `dataset`: merged dataset
* `test`: dataset with subjects, activities and test set
* `means`: dataset with feature means aggregate by subject and activity

