#!/bin/bash

# Write a shell script finder-app/finder.sh as described below:
#    1) Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem, referred to below as filesdir;
#       the second argument is a text string which will be searched within these files, referred to below as searchstr
#    2) Exits with return value 1 error and print statements if any of the parameters above were not specified
#    3) Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem
#    4) Prints a message "The number of files are X and the number of matching lines are Y" where X is the number of files in the directory and 
#       all subdirectories and Y is the number of matching lines found in respective files, where a matching line refers to a line which contains 
#       searchstr (and may also contain additional content).

# (1)
filesdir=$1
searchstr=$2

# (2)
if [ -z $filesdir ] || [ -z $searchstr ]
then
    echo "one or both of the parameters (filesdir and searchstr) were not specified."
    echo "syntax hint: finder.sh <filesdir> <searchstr>"
    exit 1
fi

# (3) Check if it is a directory
if [ ! -d $filesdir ]
then
    echo "$filesdir is not a directory"
    exit 1
fi

# (4)
# count the number of files at given directory. 
# $ - checks number of arg(;find - if directory exist; -type f - if sstandar file type; wc -l write new lines) 
numfiles=$(find $filesdir -type f | wc -l)
# count the matches in the found files
matches=$(grep -r $searchstr $filesdir | wc -l)

echo "The number of files are $numfiles and the number of matching lines are $matches"