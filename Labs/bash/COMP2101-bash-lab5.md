# Lab 5 - Advanced Scripting

## Practice Scripts

### Using functions
This exercise practices working with functions in scripts.

#### [firstfunctions.sh](scripts-lab5/firstfunctions.sh)
This exercise practices working with functions in scripts.
1. Download the firstfunctions.sh script
```bash
wget -O ~/bin/firstfunctions.sh https://zonzorp.github.io/COMP2101/Labs/bash/scripts-lab5/firstfunctions.sh
chmod +x ~/bin/firstfunctions.sh
```
1. Run it to see what it does
```bash
firstfunctions.sh
```
1. Modify the script to be do the task described in the comments in the script.
1. Test your changes to be sure they work
```bash
vi ~/bin/firstfunctions.sh
firstfunctions.sh
```

### Working with signals
#### [countdown.sh](scripts-lab5/countdown.sh)
This exercise practices working with signals in scripts.
1. Download the countdown.sh script
```bash
wget -O ~/COMP2101/bash/countdown.sh https://zonzorp.github.io/COMP2101/Labs/bash/scripts-lab5/countdown.sh
chmod +x ~/COMP2101/bash/countdown.sh
```
1. Run it to see what it does
```bash
countdown.sh
```
1. Modify the script as described in the comments in the script.
1. Test your changes to be sure they work
```bash
vi ~/COMP2101/bash/countdown.sh
countdown.sh
```

### Working with unpredictable data in loops
#### [sysconfig.sh](scripts-lab5/sysconfig.sh)
This script is designed to provide useful information about your system in a simple summary report.
This exercise practices working with hardware info and signals in scripts.
1. Download the sysconfig.sh script
```bash
wget -O ~/COMP2101/bash/sysconfig.sh https://zonzorp.github.io/COMP2101/Labs/bash/scripts-lab5/sysconfig.sh
chmod +x ~/COMP2101/bash/sysconfig.sh
```
1. Run it to see what it does
```bash
sysconfig.sh
```
1. Modify the script as described in the comments in the script.
1. Test your changes to be sure they work
```bash
vi ~/COMP2101/bash/sysconfig.sh
sysconfig.sh
```
1. If anything didn't work correctly, go back, fix the issues and repeat until it does work right.
1. Save the final version of your script to your github repository (stage, commit, push).

# Graded Script - Bash Assignment:
To be marked for the bash portion of the course, you are required to create a script and a function library that incorporates evrything you have learned about bash scripting. You may reuse pieces of scripts you already created in previous lab activities.

## Environment
Your script and your function library are required to be in the bash folder of your cloned repository. You PATH should include that folder automatically when you log in.

## Function Library
Your function library file must be called reportfunctions.sh and only contain function definitions, and not be an executable shell script. Your function library file must contain functions to perform generation of the individual outputs listed:
* function cpureport containing:
  * title
  *  labeled data showing:
    * CPU manufacturer and model
    * CPU architecture
    * CPU core count
    * CPU maximum speed in a human friendly format
    * Sizes of caches (L1, L2, L3) in a human friendly format
* function computerreport containing:
  * title
  *  labeled data showing:
    * Computer manufacturer
    * Computer description or model
    * Computer serial number
* function osreport containing:
  * title
  *  labeled data showing:
    * Linux distro
    * Distro version
* function ramreport containing:
  * title
  *  labeled data showing:
    * a table of the installed memory components with each table row having:
      * Component manufacturer
      * Component model or product name
      * Component size in a human friendly format
      * Component speed in a human friendly format
      * Component physical location in a human friendly format
    * Total size of installed RAM in a human friendly format
* function videoreport containing:
  * title
  *  labeled data showing:
    * Video card/chipset manufacturer
    * Video car/chipset decription or model
* function diskreport containing:
  * title
  *  labeled data showing:
    * a table of the installed disk drives with each table row having:
      * Drive manufacturer
      * Drive model
      * Drive size in a human friendly format
      * Partition number
      * Mount point if mounted
      * Filesystem size in a human friendly format if filesystem is mounted
      * Filesystem free space in a human friendly format if filesystem is mounted
* function networkreport containing:
  * title
  *  labeled data showing:
    * a table of the installed installed network interfaces (including virtual devices) with each table row having:
      * Interface manufacturer
      * Interface model or description
      * Interface link state
      * Interface current speed
      * Interface IP addresses in CIDR format if configured
      * Interface bridge master if part of a bridge
      * DNS server(s) and search domain(s) if any are associated with the interface
* function errormessage which:
 * saves the error message with a timestamp into a logfile named /var/log/systeminfo.log
 * displays the error message to the user on stderr

## System Report Script
Your system report script must be an executable script named systeminfo.sh. Your script must source your function library file and not contain code to perform tasks the functions perform. Your script should handle errors gracefully, check for root permission, and append errors with a timestamp to a logfile named /var/log/systeminfo.log. Your error messages should be human friendly and be handled using the errormessage function. Your script must contain comments to describe the purpose of the script and explain any non-trivial things your script does. The default behaviour of your script when run without any command line options is to print out a full system report using all of your function library functions.
Your script must support the following command line options:
* -h        display help for your script and exits
* -v        runs your script verbosely, showing any errors to the user instead of sending them to the logfile
* -system   runs only the computerreport, osreport, cpureport, ramreport, and videoreport
* -disk     runs only the diskreport
* -network  runs only the networkreport

## Grading

When your script, function library file, and modified environment file are completed and pushed to your github repo (all 3 files need to be pushed), go to Blackboard and click submit, entering the URL for your repo (https://github.com/yourgithubusername/COMP2101) as a text comment. If I cannot see your files on your github repo, I cannot give you marks for it. Late submissions will not be accepted. No exceptions.

###### This document is copyright Dennis Simpson, 2017-2023.
