# Lab 1 - Introduction to Powershell
This lab will update your local documentation on your system and give you practice using it. It will also set up permissions for executing scripts and set up a simple profile file.

## Powershell Version
To find out what version of Powershell you have, click on the start button and start typing **powershell**. It will automatically find the powershell program for you. Click on Powershell to start a powershell console window. Use the `get-host` command to display the host object for the powershell process, and look for the `version` property.
```
get-host
```
If you do not have Windows Powershell version 5.1, visit the [Microsoft docs website](https://docs.microsoft.com/en-us/powershell) and upgrade to version 5.1 of Windows Powershell.
We do not use Powershell Core for this course, but if you want to install it, you can without breaking Windows Powershell. See [Microsoft docs website](https://docs.microsoft.com/en-us/powershell) for instructions if you want to play with it.

## Script Storage and Backup/Version Control
You should already have a github repo for this course with your bash files. Download and install [Github Desktop](https://desktop.github.com). Run it to login to your [Github](https://github.com) account, and clone your COMP2101 repo to your Windows machine. Create a new folder named  **powershell** in your cloned repository on your local disk (most likely it is in **Documents/Github/COMP2101/**). Be sure to keep your repository updated as you work on your scripts, just like we did with bash.

## Help Docs
1. Run the `update-help` command in an Administrator Powershell window (started with right-click and Run As Administrator) to install the complete help pages on your PC
```powershell
update-help -ea silentlycontinue
```
1. Run the following commands to become acquainted with the help commands:
```powershell
help about_
help get-
help get-date
help get-host
help clear-host
```
1. Compare the output of the following commands:
```powershell
help get-date
help -detailed get-date
help -examples get-date
help -full get-date
help -online get-date
show-command
```
1. Try using the `get-date` command with tab completion to see all available parameters
1. Run the help command for get-date with the `-Full` parameter to see what additional help is available.
1. Using the command help pane in ise, construct and run a `get-date` command to show the date with the data set to your birthdate

## Execution Policy
1. Run the `get-executionpolicy` command to see your current execution policies
```powershell
get-executionpolicy -list
```
1. Create the `helloworld.ps1` file described in the presentation in your scripts folder (the one you cloned from Github if you are using Github)
1. Try to run your `helloworld.ps1` script as a command
```powershell
./helloworld.ps1
```
1. Use the `set-executionpolicy` command to change your execution policy to the Microsoft-recommended policy
```powershell
set-executionpolicy remotesigned
```
1. Use the `get-executionpolicy` command to see what changed
```powershell
get-executionpolicy -list
```
1. Try again to run your `helloworld.ps1` script
```powershell
./helloworld.ps1
```

## Profiles
1. Create a profile file for yourself which adds your cloned repository powershell scripts folder to your command path
  * **The example shown assumes you have cloned a repository from github named COMP2101 into the default location in your home folder and that you have a folder named powershell in that repository to hold your powershell scripts**
```powershell
'$env:path += ";$home/documents/github/comp2101/powershell"' >> $profile
```
1. Start a new powershell window and verify you can run your helloworld script without having to specify the path to the script, then display the contents of your path variable
```powershell
helloworld.ps1
$env:path
```

## Grading
This lab prepares you for the next lab and builds the environment for lab 5 which is the only powershell lab that is marked.
