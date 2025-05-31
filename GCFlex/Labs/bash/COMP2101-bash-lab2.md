# Lab 2 - Working with data in bash
The purpose of this lab is to develop skills in using, storing, and manipulating data in bash scripts. Do the practice activities before trying to do the hostname-changer.sh script.

## Practice Activities

### [getpics.sh](scripts-lab2/getpics.sh)
The purpose of the script is to download some image files, put them into your **~/public_html/pics** directory, and then summarize what was put there. The script uses the test command to check if files and directories exist before trying to use them. It can be improved fairly easily.

#### Example run with output:
```
$ getpics.sh
Found 23 files in the Pictures directory.
The Pictures directory uses 4.3M space on the disk.
```
#### Task:
1. Download the script and try running it
```bash
wget -O ~/COMP2101/bash/getpics.sh https://zonzorp.github.io/COMP2101/Labs/bash/scripts-lab2/getpics.sh
chmod +x ~/COMP2101/bash/getpics.sh
```
1. Modify the script according to the tasks in the script's comments.
1. Test your improvements to make sure they work
```bash
vi ~/COMP2101/bash/getpics.sh
getpics.sh
```
1. Save the final version of your script to your github repository (stage, commit, push).

### [improveddice.sh](scripts-lab2/improveddice.sh)
This exercise practices working with arithmetic and producing useful output.
1. Download the improveddice.sh script and do the following exercises to practice creating arithmetic statements and generating clean, useful output
```bash
wget -O ~/COMP2101/bash/improveddice.sh https://zonzorp.github.io/COMP2101/Labs/bash/scripts-lab2/improveddice.sh
chmod +x ~/COMP2101/bash/improveddice.sh
```
1. Run it to see what it does
```bash
improveddice.sh
```
1. Modify the script according to the tasks in the script's comments.
1. Test your changes to be sure they work
```bash
vi ~/COMP2101/bash/improveddice.sh
improveddice.sh
```
1. Save the final version of your script to your github repository (stage, commit, push).

### [arithmetic-demo.sh](scripts-lab2/arithmetic-demo.sh)
This exercise provides practice with doing arithmetic and math in a bash script
1. Download the arithmetic-demo.sh script and do the following improvements to practice working with numbers in bash
```bash
wget -O ~/COMP2101/bash/arithmetic-demo.sh https://zonzorp.github.io/COMP2101/Labs/bash/scripts-lab2/arithmetic-demo.sh
chmod +x ~/COMP2101/bash/arithmetic-demo.sh
```
1. Run it to see what it does
```bash
arithmetic-demo.sh
```
1. Modify the script according to the tasks in the script's comments.
1. Test your changes to be sure they work
```bash
vi ~/COMP2101/bash/arithmetic-demo.sh
arithmetic-demo.sh
```
1. Save the final version of your script to your github repository (stage, commit, push).

### [welcome-message.sh](scripts-lab2/welcome-example.sh)
This exercise practices using and creating dynamic data on the command line in a script.
1. Download the improveddice.sh script and do the following exercises to practice working with dynamic data on the command line
```bash
wget -O ~/COMP2101/bash/welcome-message.sh https://zonzorp.github.io/COMP2101/Labs/bash/scripts-lab2/welcome-example.sh
chmod +x ~/COMP2101/bash/welcome-message.sh
```
1. Run it to see what it does
```bash
welcome-message.sh
```
1. Modify the script according to the tasks in the script's comments.
1. Test your changes to be sure they work
```bash
vi ~/COMP2101/bash/welcome-message.sh
welcome-message.sh
```
1. Save the final version of your script to your github repository (stage, commit, push).


# Challenge Script:
## sysinfo.sh - a script to display information about a computer

Your task is to improve the script named **sysinfo.sh** from the previous lab, and to run it on your Linux computer. Be sure you test it and update your github site with your finished script.

### sysinfo.sh
The purpose of this script is to display some important identity information about a computer so that you can see that information quickly and concisely, without having to enter multiple commands or remember multiple command options. It is a typical script in that it is intended to be useful, time and labour saving, and easily used by any user of the computer regardless of whether they know or understand any of the commands in your script.
The improvements we will do are designed to include more information and make it easier to read with more concise and human friendly data. The following improvements are to be done to get full marks for this lab:
* Use an output template, with a cat command or something similar that has embedded variables for your report data
* The output must have a blank line followed by a title with a separator line, and a matching separator line with a blank line at the end.
* Each data item in the output must be labelled.
* The hostname must be in a report title as a simple hostname, and the fully qualified domain name must be in the report detail like in the previous lab.
* The operating system name and version must have only the distro name and version.
* Only one IP address is to be shown and it is be the IP address used by your computer when sending or receiving data from the interface that provides your default route to the internet so use the `ip route` command to find that address.
* Only your free disk space number is to be on the root filesystem space line and it must be be a human-friendly number.

#### Example run with output:
```
$ ./sysinfo.sh

Report for myvm
===============
FQDN: myvm.home.arpa
Operating System name and version: Debian GNU/Linux 10 (buster)
IP Address: 192.168.0.16 
Root Filesystem Free Space: 5.6G
===============

```

#### What to put in your script:
You can use whatever commands you like to create your script. But ensure your script begins with the command interpreter specification (#!/bin/bash), and has sufficient comments to explain what the script is doing and how it does it. Here is a list of some of the commands you might find useful in your script to generate the necessary output. You can use whatever commands you like, but you need to keep your output labelled, concise, and easy to read. Your work must be your own. Work copied from the internet or from another student will not be accepted.
```bash
echo
hostname
ip
grep
df
cut
awk
sed
```

1. Test your script, and make sure it works before proceeding to the next step
```bash
vi ~/COMP2101/bash/sysinfo.sh
sysinfo.sh
```

1. Save the final version of your script to your github repository (stage, commit, push).
```bash
git add ~/COMP2101/bash/sysinfo.sh
git commit -m "your commit comment"
git push
```

## Grading
The scripts you create in this lab and save to your github will be considered when assessing your skills in scripting with bash. The assessment of your bash skills will be done using all of your work saved on your github at the end of the semester.

###### This document is copyright Dennis Simpson, 2013-2023.
