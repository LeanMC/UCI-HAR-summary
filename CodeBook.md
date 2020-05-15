Code Book
=========

Description
-----------
This data is the result of subsetting and analyzing the [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The original dataset is split into two subsets: 'test' and 'train'. These subsets were merged into one. The original dataset had information about test subjects and activities stored in separate files. These files were also merged with the other data. Activities in the original dataset were represented with integers, which were replaced with descriptive activity names. The variable names for measured data in the original set were stored in a separate file. These were extracted and set as column names. This large, rectangular data was stored in a tibble called `testrain`.

Next, `testrain` was subsetted, selecting only columns containing `mean()` and `std()`. Based on a close reading of the original dataset's README files and feature names, I believe these features best represent "the measurements on the mean and standard deviation for each measurement". Finally, the mean for each variable for each activity and each subject was calculated and stored in a new, independent tidy data set called `tidy`.

Variables
---------
Below is a table of the variables in `tidy`, along with a brief description.

Variable | Description
-------- | -----------
subject | An integer representing the subject completing the activity. Subjects are numbered from 1-30.
activity | Categorical. One of 'walking', 'walking uphill', 'walking downhill', 'sitting', 'standing', or 'laying'.
tBodyAcc-mean()-X, tBodyAcc-mean()-Y, et al | These variables are the averages (arithmetic means) of all features from the original data set that contained `mean()` or `std()`. Units for variables with Acc are 'standard gravity units' (g). For variables containing Gyro, they are radians/second. Presumably, the Jerk variables are in g/second, but frankly the documentation from the original data set is a little bit skimpy on details regarding units. 

N.B.: What we have here are means of means and means of standard deviations of the raw data. Beacuse these variables are similar and numerous, the original feature names have been preserved as the column names. A more thorough and potentially confusing description of the original features can be found in the original data set.
