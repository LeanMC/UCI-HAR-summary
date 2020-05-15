<h1>README.md</h1>
This repository contains three files:

1. `README.md` - This file
2. `run_analysis.R` - An R script that obtains, tidies, and analyzes the original data set
3. 'CodeBook.md' - A description of what was done to the dataset and the variables in the processed data

In addition to the explanations in `CodeBook.md`, I have attempted to provide useful comments in `run_analysis.R` for individuals trying to understand what they're looking at. Here is one more description of what is going on:

`run_analysis.R` will download a ZIP archive of data from the [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). It then extracts the archive, tidies the data, extracts mean and standard deviation measurements from it, and calculates the mean of these values for each subject and activity. A more detailed description of this process can be found in `CodeBook.md` and in the comments of `run_analysis.R`. The result is a tidy tibble with the desired averages of averages and standard deviations. `CodeBook.md`, in addition to another description of this process, contains a list of names and descriptions of the variables in the final tidy tibble.
