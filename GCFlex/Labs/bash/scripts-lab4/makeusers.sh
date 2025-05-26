#!/bin/bash
# this script allows an admin to create multiple user accounts quickly
# it takes csv data as input on stdin in the following format:
#   username,fullname,password,homedirectory,userid,groupid,extragroups
# username must be present
# fullname must be present
# homedirectory defaults to /home/username if none is present
# userid defaults to the system default if none is present
# groupid defaults to the system default if none is present
# extragroups is optional, but if present must be formatted as:
#   groupname,groupname,groupname,etc.

# Task 1: Add a verbose option to the script ( -v )
# Task 2: Move the display of command help to a function
# Task 3:

debug=0
programname=$(basename $0)
while [ $# -gt 0 ]; do
	case "$1" in
	-h | --help )
		echo "Usage: $programname [-h] [-d level] file"
		exit 0
		;;
	-d | --debug )
		if [[ "$2" =~ ^[1-9]$ ]]; then
			debug="$2"
			shift
			echo "Debug mode ON, level $debug"
		else
			echo "Cannot set debug without a debug level from 1 to 9"
			exit 2
		fi
		;;
	* )
		echo "Usage: $programname [-h] [-d level] file"
		echo "Argument '$1' not recognized"
		exit 2
		;;
	esac
	shift
done

# Get a line of input
oldIFS=$IFS
IFS=','
read username fullname password homedir userid groupid extragroups
IFS=$oldIFS
[ "$verbose" = "y" ] && cat <<EOF
Found:
  $username
  $fullname
  $password
  $homedir
  $userid
  $groupid
  $extragroups
EOF
# Fail if not given username
if [ -z "$username" -o -z "$fullname" ]; then
	echo "Must have a username and full name - cannot proceed without them"
fi

# strip off quotes from csv
username=$(sed -e 's/^"//' -e 's/"$//' <<< $username)
fullname=$(sed -e 's/^"//' -e 's/"$//' <<< $fullname)
password=$(sed -e 's/^"//' -e 's/"$//' <<< $password)
homedir=$(sed -e 's/^"//' -e 's/"$//' <<< $homedir)
userid=$(sed -e 's/^"//' -e 's/"$//' <<< $userid)
groupid=$(sed -e 's/^"//' -e 's/"$//' <<< $groupid)
extragroups=$(sed -e 's/^"//' -e 's/"$//' <<< $extragroups)
# Check if the user already exists
grep -q "^${username}:" /etc/passwd
if [ $? -ne 0 ]; then
#   Create the user if necessary using all the values given in the input
	[ "$verbose" = "y" ] && echo "Creating $username"
	[ -n "$homedir" ] && homeoption="-d $homedir"
	[ -n "$userid" ] && useridoption="-u $userid"
	[ -n "$groupid" ] && groupoption="-g $groupid"
	[ -n "$extragroups" ] && groupsoption="-G $extragroups"
	expireoptions="-f 1 -e $(date +%Y-%m-%d)"
	echo useradd -m $homeoption -c "$fullname" $groupoption $groupsoption $expireoptions $username
	echo setting password to $password
	#done with user
	exit
fi
[ "$verbose" = "y" ] && echo "User $username already exists"
# Check for a value in the password column
#   If there is a value
#     Check if the password is already correct
#     If it is not
#       Set the password for the user
#       Display a message about it if verbose was specified
