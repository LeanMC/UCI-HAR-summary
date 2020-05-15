#load the tidyverse. enough constituent packages were used to warrant loading the
#whole thing
library(tidyverse)

#download and unzip the data
download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
              destfile = 'getdata_projectfiles_UCI HAR Dataset.zip')
unzip('getdata_projectfiles_UCI HAR Dataset.zip')
setwd('UCI HAR Dataset')

#lines 15-34 do the following: 
#load the data, label the data set with descriptive variable names (#4), and 
#merge test train sets (#1). the resulting dataset is a tibble called 'testrain'.

features <- read_delim('features.txt', delim = ' ', col_names = FALSE, col_types = '_c') %>% pull()

X <- c('test/X_test.txt', 'train/X_train.txt') %>%
    map(read_delim, delim = ' ', col_names = features, 
        col_types = cols(.default = 'd'), trim_ws = TRUE) %>%
        reduce(rbind)

#NB: this introduces warnings because some of the feature names are EXACT duplicates
#of one another. I am not sure how to handle this. In fact I don't really know why
#there are two identical features in the first place.

y <- c('test/y_test.txt', 'train/y_train.txt') %>%
    map(read_table, col_names = 'activity', col_types = 'f') %>%
    reduce(rbind)

subject <- c('test/subject_test.txt', 'train/subject_train.txt') %>%
    map(read_table, col_names = 'subject', col_types = 'i') %>%
    reduce(rbind)

testrain <- bind_cols(subject, y, X)

#extract mean and standard deviation measurements (#2)
testrain <- testrain %>% select(matches('(subject|activity|mean\\(\\)|std\\(\\))'))

#make activity names descriptive (#3)
testrain <- testrain %>% mutate(activity = fct_recode(activity, 
                                                      'walking' = '1',
                                                      'walking upstairs' = '2',
                                                      'walking downstairs' = '3',
                                                      'sitting' = '4',
                                                      'standing' = '5',
                                                      'laying' = '6'))

#create a tidy dataset with the average of each variable for each activity and subject
tidy <- testrain %>% group_by(subject, activity) %>% summarize_all(mean)

#NB while i wish the assignment's instructions could've been followed in the numerical 
#order they were given (#1-#4), efforts to make that happen resulted in ugly code.