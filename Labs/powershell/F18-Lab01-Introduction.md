# Lab 1 - Introduction to Powershell
This lab will update your local documentation on your system and give you practice using it. It will also set up permissions for executing scripts and set up a simple profile file.

## Help Docs
1. Run the `update-help` command in an Administrator Powershell window (started with right-click and Run As Administrator) to install the complete help pages on your PC
```powershell
update-help -ea silentlycontinue
```
1. Run the following commands to become acquainted with the help commands:
```powershell
get-help about_
get-help clear-
get-help get-
get-help set-
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
1. Try using the `get-date command` with tab completion to see all available parameters
1. Using the command help pane in ise, construct and run a `get-date` command to show the date with the data set to your birthdate
1. Submit a screenshot showing the update-help command running with the green-highlighted text showing at the top of the window.

## Execution Policy
1. Run the `get-executionpolicy` command to see your current execution policies
```powershell
get-executionpolicy -list
```
1. Create the `helloworld.ps1` file described in the presentation in your scripts folder (the one you cloned from Github if you are using Github, or a folder you create locally to hold your scripts if you aren't using Github)
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
1. Submit a screenshot of your powershell window showing the helloworld.ps1 command and its output


## Profiles
1. Create a profile file for yourself which adds your scripts folder to your command path
  * **The example shown assumes you have cloned a repository from github named comp2101 into the default location on your C: drive and that you have a folder named powershell in that repository to hold your powershell scripts**
```powershell
'$env:path += ";$home/documents/github/comp2101/powershell"' >> $profile
```
1. Start a new powershell window and verify you can run your helloworld script without having to specify the path to the script
```powershell
helloworld.ps1
```
1. Submit a screenshot of your new powershell window showing your profile in notepad
