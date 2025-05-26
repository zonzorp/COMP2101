#!/bin/bash

# This script prints out how many files, space used, and largest files found in the directory specified as arg1 on the command line.

# Sort out the command line

if [ -z "$1" ]; then
  echo "You must specify a directory for me to work on."
  exit 1
fi

target_directory=$1

if [ ! -d "$target_directory" ]; then
  echo "You didn't specify a directory to work on, $target_directory is not a directory."
  exit 1
fi

# count the entries in the list
filescounted=`find $target_directory -type f|wc -l`
if [ $? != 0 ]; then
	echo "Unable to count files, exiting..."
  exit 1
fi
if [ $filescounted -eq 0 ]; then
	echo "No files in $target_directory to work on"
	exit
fi

# print the result
echo "There are $filescounted files in the $target_directory directory tree."

# This prints out the 10 largest files in the directory tree specified as arg1 on the command line.

# find file sizes, sort the result numerically, complain if the command list fails
echo "The ten largest files in '$target_directory' in descending order are:"
find $target_directory -type f -exec du -h {} \; | sort -hr | head
echo
