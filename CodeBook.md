Code Book
=========

Description
-----------
This data is the result of subsetting and analyzing the [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

A brief summary of what was done to the original data set:
- The original dataset is split into two subsets: `test` and `train`. These subsets were merged into one. 
- The original dataset had information about test subjects and activities stored in separate files. These files were joined with the other data. 
- Activities in the original dataset were represented with integers, which have been replaced with descriptive activity names. - The variable names for measured data in the original set were stored in a separate file. These were extracted and used to set variable (i.e. column) names. 
- The resulting tibble was stored as `testrain`.
- `testrain` was subsetted, selecting only columns containing `mean()` and `std()`. Based on a close reading of the original dataset's `README` files and feature names, I believe these features best represent "the measurements on the mean and standard deviation for each measurement". 
- The mean for each variable for each activity and each subject was calculated and stored in a new, independent tidy data set called `tidy`.
- This tibble was exported using `write.table`.

Variables
---------
Below is a table of the variables in `tidy`, along with a brief description.

Variable | Description
-------- | -----------
`subject` | An integer representing the subject completing the activity. Subjects are numbered from 1-30.
`activity` | Categorical. One of `walking`, `walking uphill`, `walking downhill`, `sitting`, `standing`, or `laying`.
`tBodyAcc-mean()-X`, `tBodyAcc-mean()-Y`, et al | The remaining variables are the averages (arithmetic means) of all features from the original data set whose names contained the strings `mean()` or `std()`. As best I can tell from the original data set's documentation, variables whose names contain `Acc` are measured in 'standard gravity units' (g), while variables whose names contain `Gyro` are in radians/second. Presumably, the `Jerk` variables are in g/second.

N.B.: More details about the measurement of these variables can be found in the original data set.
