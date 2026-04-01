#!/bin/bash

#Write a shell script finder-app/writer.sh as described below
#    1) Accepts the following arguments: the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile; 
#       the second argument is a text string which will be written within this file, referred to below as writestr
#    2) Exits with value 1 error and print statements if any of the arguments above were not specified
#    3) Creates a new file with name and path writefile with content writestr, overwriting any existing file and creating the path if it doesn’t exist. Exits 
#       with value 1 and error print statement if the file could not be created.

writefile=$1
writestr=$2

if [ -z $writefile ] || [ -z $writestr ]
then
    echo "one or both of the needed arguments were not specified."
    echo "syntax hint: write.sh <writefile> <writestr>"
    exit 1
fi

writepath=$(dirname $writefile)
mkdir -p $writepath

if [ $? -ne 0 ]
then
    echo "Couldn't create path. Possibility: path already exist"
    exit 1
fi

echo $writestr > $writefile

if [ $? -ne 0 ]
then
    echo "Couldn't create file with name $writepath"
    exit 1
fi
