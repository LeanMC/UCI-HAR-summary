Code Book
=========

Description
-----------
This data is the result of subsetting and analyzing the [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

A brief summary of what was done to the original data set:
- The original dataset was split into two subsets: `test` and `train`. These subsets were merged into one. 
- The original dataset had information about subjects and activities stored in separate files. These files were joined with the other data. 
- Activities in the original dataset were represented with integers, which have been replaced with descriptive activity names. 
- The variable names for measured data in the original set were stored in a separate file. These were extracted and used to set variable (i.e. column) names. 
- The resulting tibble was stored as `testrain`.
- `testrain` was subsetted, selecting only columns containing `mean()` and `std()`. Based on a close reading of the original dataset's `README` files and feature names, I believe these features best represent "the measurements on the mean and standard deviation for each measurement". 
- "The average of each variable for each activity and each subject" was calculated and stored in a new, independent tidy data set called `tidy`.
- This tibble was exported using `write.table` and submitted for grading along with links to this repository. I have elected not to include course-specific code and data here so as to not waste GitHub's disk space.

Variables
---------
Below is a table of the variables in `tidy`, along with a brief description.

Variable | Description
-------- | -----------
`subject` | An integer representing the subject completing the activity. Subjects are numbered from 1-30.
`activity` | Categorical. One of `walking`, `walking uphill`, `walking downhill`, `sitting`, `standing`, or `laying`.
`tBodyAcc-mean()-X`, `tBodyAcc-mean()-Y`, et al | The remaining variables are the averages (arithmetic means) of all features from the original data set whose names contained the strings `mean()` or `std()`. See the note below about their units.

Note about units
----------------
As best I can tell from the original data set's documentation, variables whose names contain `Acc` were originally measured in 'standard gravity units' (g), while variables whose names contain `Gyro` were measured in radians/second. Presumably, the `Jerk` variables were measured in g/second, but this is not explicitly documented. It should be noted that the measurements have also been filtered heavily, according to the documentation:

>they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

All of this is a long-winded way of saying that I'm not really sure what to call the units of these features, but I *do* think they still bear a meaningful correlation to their unfiltered origins, wihch is why I've included the original units in this note. I strongly encourage curious parties to read `features_info.txt` from the original data set for more information.
