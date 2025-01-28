#!/bin/bash
# This script demonstrates how the shift command works

# create an empty array to put the command line arguments into
myargs=()
# loop through the command line arguments
while [ $# -gt 0 ]; do
  # tell the user how many things are left on the command line
  echo "There are $# things left to process on the command line."
  # add whatever is in $1 to the myargs array
#  myargs+=("$1")
  # tell the user what we did
#  echo "Added \'$1\' to the arguments array"

# TASK 1: instead of just adding arguments to an array, use a case statement to recognize some options
#          Options to recognize: -h for help, -v for verbose mode, -d N for debug mode with N being a single digit number
#          If the help option is recognized, print out help for the command and exit
#          If the verbose option is recognized, set a variable to indicate verbose mode is on
#          If the debug optionis recognized, set a variable with the debug level from the number given after the -d on the command line
#             display an error if the user gave the -d option without a single digit number after it
#          Anything that wasn't recognized on the command line should still go into the myargs array

  case "$1" in
	  -h )
		  # do the help option processing
		  echo "cmdargs.sh [-v] [-h] [-d N] [data1 data2 data3 ...]"
		  [ "$verbose" = "on" ] && cat <<EOF
-h is the help option which will print out the help and exit the script
-v is the verbose option which will make the script more talkative
-d is the debug option, it requires a number which is the debug level and will cause additional debugging to happen when the script runs
the rest of the line can have zero or more data items for the script to work on
EOF
		  exit
		  ;;
	  -v )
		  # do the verbose option processing
		  verbose="on"
		  echo "Verbose mode turned on"
		  ;;
	  -d )
		  # check for a number in $2, give an error if it isn't there
		  # do the debug option processing
		  ;;
	  * )
		  # add $1 to the myargs array
		  myargs+=("$1")
  		  echo "Added \'$1\' to the arguments array"
		  ;;
  esac



  # each time through the loop, shift the arguments left
  # this decrements the argument count for us
  shift
  # tell the user we shifted things
  echo "Shifted command line, leaving $# things left to process."
  echo "--------------------------"
  # go back to the top of the loop to see if anything is left to work on
done

# TASK2: display the settings and myargs contents
#         Tell the user if vebose mode is on
[ "$verbose" = "on" ] && echo verbose mode is on
#         Tell the user if debug mode is on and if it is, what number it is set to
#         Print out the myargs array with a label

echo "Done"
