#!/bin/bash
# this script demonstrates using a case statement to process the command line

##########################
## Initialize Variables ##
##########################
# the debug variable sets a debugging output indicator
# a zero means no debugging output is to be produced
# 1 means some output, 2 means more output, etc.
debug=0

# this declares a variable to be of type array, so it can store multiple indexed items of data
declare -a stuffToProcess

##################################
## Create functions as required ##
##################################
# this function prints out how to use this script for a user who doesn't know
# the -h option prints out the help for this script
# the -d option requires a level which is a number, and sets the debugging output level
# No other options are recognized
# Nothing else is acceptable on this command line
function usagehelp {
	echo "Usage: $0 [-d|--debug 1-9] [-h | --help] [data...]"
}

## the main functioning part of the script starts here
##############
## MAIN     ##
##############

#####################################
## Command Line Processor          ##
#####################################
while [ $# -gt 0 ]; do

	# Evaluate the data in the first thing on the command line ($!)
	case "$1" in
		# Check for the help option
	-h | --help )
	  # we got the help option !!! Display the help
		usagehelp
		# help displayed, script done, exit with success
		exit 0
		;;
		# done processing help options

		# check for debug option which requires extra data (the level)
	-d | --debug )
	# we got the debug option, validate the level in the next thing on the command line ($2)
		if [[ "$2" =~ ^[1-9]$ ]]; then
			# yay, we got a single digit from 1 to 9 in the next thing on the command Line
			# save it in the debug variable for later use in our script
			debug="$2"
			# add a shift to get past the debug level in $2
			shift
			# tell them we are in debug mode
			echo "Debug mode ON, level $debug"
		else
			# rats, user didn't give us a valid level to set for debugging
			# express our disappointment
			echo "Cannot set debug without a debug level from 1 to 9"
			# cannot properly interpret command line, exit with failure
			exit 2
		fi
		;;
		# done processing debug options

		# user did not give the help or debug option (aka they put something unrecognized on the command line)
	* )
	  # put unrecognized command line data into our array
		stuffToProcess+=("$1")
		;;
		# end of handling extra stuff on the command line
	esac
	# Done evaluating the first thing on the command Line, shift past this thing on the command line before going back to check for more
	shift

	# print out debugging information about the current state of command line processing if the debug level is greater than 0
	[ $debug -gt 0 ] && test $# -gt 1 && echo "$# args left to process"
	[ $debug -gt 0 ] && test $# -eq 1  && echo "1 arg left to process"

done
###################################
## End of Command Line Processor ##
###################################

# Variqbles are initialized
# functions are defined
# command line options processed, data saved as necessary
# begin script job
[ ${#stuffToProcess[@]} ] && echo "Will do work on ${stuffToProcess[@]} (${#stuffToProcess[@]} items)"
