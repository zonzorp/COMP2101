# Lab 3 - Controlling execution in bash
The purpose of this lab is to develop skills in using, storing, and manipulating data in bash scripts.

### [checkMYVAR.sh](scripts-lab3/checkMYVAR.sh)
This exercise gives some exposure to testing variable content.
1. Download the checkMYVAR.sh script and do the following exercises to see how exporting variables can affect programs you run
 ```bash
 wget -O ~/COMP2101/bash/checkMYVAR.sh https://zonzorp.github.io/COMP2101/Labs/bash/scripts-lab3/checkMYVAR.sh
 chmod +x ~/COMP2101/bash/checkMYVAR.sh
 ```
1. Run it without creating the MYVAR variable
 ```bash
 checkMYVAR.sh
 ```
1. On your command line, create the MYVAR variable without putting anything in it, then run the script
 ```bash
 MYVAR=
 checkMYVAR.sh
 ```
1. Put some data in the MYVAR variable, and try running the script again
 ```bash
 MYVAR="some data"
 checkMYVAR.sh
 ```
1. Export the MYVAR variable, and try running the script again
 ```bash
 export MYVAR
 checkMYVAR.sh
 ```
1. Remove the data from the MYVAR variable, and try running the script again
 ```bash
 MYVAR=
 checkMYVAR.sh
 ```
1. Delete the MYVAR variable, and try running the script again
 ```bash
 unset MYVAR
 checkMYVAR.sh
 ```
1. Create and export the MYVAR variable in a single command, and try running the script again
 ```bash
 export MYVAR="some data"
 checkMYVAR.sh
 ```

## login-welcome
This exercise converts the example welcome script to one which displays its output in a more fun way, suitable for use in a login script.
1. Use your welcome-message.sh script as a starting point by making a copy of of it called login-welcome.sh
```bash
cp ~/COMP2101/bash/welcome-message.sh ~/COMP2101/bash/login-welcome.sh
```
1. Modify it to store the output in a variable instead of displaying it on the screen directly
1. Use the cowsay command to display the variable containing your output
1. Test your changed script to make sure it works before proceeding to the next step
```bash
vi ~/COMP2101/bash/login-welcome.sh
login-welcome.sh
```
1. Modify your .bash_login file (create it if necessary) to run your login-welcome.sh script
1. Test it to be sure it works, then test that it runs at login by logging in with ssh
```bash
vi ~/.bash_login
bash ~/.bash_login
ssh localhost
```
1. Save the final version of your script to your github repository (stage, commit, push).

### [tests.sh](scripts-lab3/tests.sh)
This exercise practices testing files, numbers, and strings.
1. Download the tests.sh script
```bash
wget -O ~/COMP2101/bash/tests.sh https://zonzorp.github.io/COMP2101/Labs/bash/scripts-lab3/tests.sh
chmod +x ~/COMP2101/bash/tests.sh
```
1. Run it to see what it does
```bash
tests.sh
```
1. Modify the script according to the tasks in the script's comments.
1. Test your changes to be sure they work
```bash
vi ~/COMP2101/bash/tests.sh
tests.sh
```

### [guessinggame.sh](scripts-lab3/guessinggame.sh)
This exercise practices looping and testing user input.
1. Download the guessinggame.sh script
```bash
wget -O ~/COMP2101/bash/guessinggame.sh https://zonzorp.github.io/COMP2101/Labs/bash/scripts-lab3/guessinggame.sh
chmod +x ~/COMP2101/bash/guessinggame.sh
```
1. Run it to see what it does
```bash
guessinggame.sh
```
1. Modify the script according to the tasks in the script's comments.
1. Test your changes to be sure they work
```bash
vi ~/COMP2101/bash/guessinggame.sh
guessinggame.sh
```

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
The scripts you create in this lab and save to your github will be considered when assessing your skills in scripting with bash. The assessment of your bash skills will be done using all of your work saved on your github at the end of the semester.

###### This document is copyright Dennis Simpson, 2013-2023.
