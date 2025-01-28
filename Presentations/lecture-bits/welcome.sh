#!/bin/bash
# this script prints out my my welcome message
# The message looks like Welcome to planet hostname, title name!
#                        Today is weekday.

myhostname=`hostname`
mytitle="Supreme Commander"
myname="Dennis"
weekday=$(date +%A)

echo "Welcome to planet $myhostname, $mytitle $myname!"
echo "Today is $weekday."
