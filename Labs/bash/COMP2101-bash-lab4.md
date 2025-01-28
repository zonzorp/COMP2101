# Lab 4 - Execution Control
This script is designed to give you practice with the skills learned in lesson 4, and practice working with controlling which commands run in your script.

# Practice Script:
## [netid.sh](scripts-lab4/netid.sh)
This exercise practices looping with the for command and a wordlist.
1. Download the netid.sh script
```bash
wget -O ~/COMP2101/bash/netid.sh https://zonzorp.github.io/COMP2101/Labs/bash/scripts-lab4/netid.sh
chmod +x ~/COMP2101/bash/netid.sh
```
1. Run it to see what it does
```bash
netid.sh
```
1. Modify the script as described in the comments in the script.
1. Test your changes to be sure they work
```bash
vi ~/COMP2101/bash/netid.sh
netid.sh
```
1. Save the final version of your script to your github repository (stage, commit, push).
1. If anything didn't work correctly, go back, fix the issues and repeat until it does work right.

# Challenge Script:
## Further Improvements to sysinfo.sh
This lab will build on the sysinfo.sh script from the previous lab. Keeping all the main goals from the previous labs, your output should be displayed in sections, with titles and all data should be labeled. Only the required data should be present in the output.

In this lab, we are adding content, not so much changing what we are doing. Some of this content will require you to evaluate what output comes from the commands you are using instead of just printing it out.

### Add sections to your report, so that the output is visually easier to use.
* Each section should have a title, and each section should be visually separate from the previous section for easy reading.
* Any data item which would be blank because data is not available at runtime should not be included in the output. If an entire section would be blank, your script must include an error message that tells the user that data for that section is unavailable.
* Most of the data for this report will come from the ```lshw``` command family, and possibly ```dmidecode```. They are not fast commands, so you should only run them once, saving their output in a variable which is then parsed for the needed output data for your report.
* These commands require root privilege, so your script should begin by checking if the user running it has root privilege and if they do not, it should display an error message telling the user they require root, and then exiting with a failure status.
* If any of your commands might fail, you should be checking if they do and printing appropriate error messages.
* If your computer has multiple CPUs, your CPU section should be improved to show information for each CPU.

### Report content
#### A section for system description containing:
* title
* Computer manufacturer
* Computer description or model
* Computer serial number

#### A section for CPU information containing:
* title
* CPU manufacturer and model
* CPU architecture
* CPU core count
* CPU maximum speed in a human friendly format
* Sizes of caches (L1, L2, L3) in a human friendly format

#### A section for operating system information containing:
* title
* Linux distro
* Distro version

#### A section for RAM containing:
* title
* a table of the installed memory components (DIMMs, SODIMMs, etc.) with each table row having:
* Component manufacturer
* Component model or product name
* Component size in a human friendly format
* Component speed in a human friendly format
* Component physical location in a human friendly format
* Total size of installed RAM in a human friendly format

#### A section for disk storage containing:
* title
* a table of the installed disk drives with each table row having:
* Drive manufacturer
* Drive model
* Drive size in a human friendly format
* Partition number
* Mount point if mounted
* Filesystem size in a human friendly format if filesystem is mounted
* Filesystem free space in a human friendly format if filesystem is mounted

### Create, test, and save your script
1. Create your script as described above.
1. Test your script to be sure it works as required
```bash
vi ~/COMP2101/bash/sysinfo.sh
sysinfo.sh
```
1. If anything didn't work correctly, go back, fix the issues and repeat until it does work right.
1. Save the final version of your script to your github repository (```git add```, ```git commit -m message```, ```git push```).


## Grading
There is nothing to submit for this lab. This lab exists to create a useful script and learn to use some important commands. It will provide the basis for the Bash Assignment later in the course which does count towards your semester mark. Ask your professor for help to complete this lab before starting the next lessson in this course if you are unable to complete it on your own.

###### This document is copyright Dennis Simpson, 2017-2023.
