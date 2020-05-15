README.md
=========

This repository contains three files:

1. `README.md` - This file
2. `run_analysis.R` - An R script that downloads, tidies, and analyzes the original data set
3. `CodeBook.md` - A description of what was done to the data set and the variables in the processed data

Outline of processing
---------------------
What follows is duplicated in `CodeBook.md` for the simple reason that the assignment instructions seem (inexplicably) to suggest that an outline of the data processing process should be in both files. My apologies for the waste; I blame the assignment instructions.

Gripes and disclaimers aside, here is a brief summary of what was done to the original data set:
- The original dataset is split into two subsets: `test` and `train`. These subsets were merged into one. 
- The original dataset had information about test subjects and activities stored in separate files. These files were joined with the other data. 
- Activities in the original dataset were represented with integers, which have been replaced with descriptive activity names. - The variable names for measured data in the original set were stored in a separate file. These were extracted and used to set variable (i.e. column) names. 
- The resulting tibble was stored as `testrain`.
- `testrain` was subsetted, selecting only columns containing `mean()` and `std()`. Based on a close reading of the original dataset's `README` files and feature names, I believe these features best represent "the measurements on the mean and standard deviation for each measurement". 
- The mean for each variable for each activity and each subject was calculated and stored in a new, independent tidy data set called `tidy`.
- This tibble was exported using `write.table`.
