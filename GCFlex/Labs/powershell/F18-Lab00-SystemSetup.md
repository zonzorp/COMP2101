# System Setup For Powershell Labs
In this lab, you will make sure you are ready to do the powershell labs in this course by having a current version of powershell. In this course, we are only working with Windows Powershell, so you will need a Windows machine (physical or virtual) to do the labs. Windows 10 is recommended, Windows 7 is the minimum. Windows Server is not recommended for these labs, but can also be used.

## Powershell Version
To find out what version of Powershell you have, click on the start button and start typing **powershell**. It will automatically find the powershell program for you. Click on Powershell to start a powershell console window. Use the `get-host` command to display the host object for the powershell process, and look for the `version` property.
```
get-host
```
If you do not have at least version 5.1, visit the [Microsoft docs website](https://docs.microsoft.com/en-us/powershell/scripting/setup/installing-windows-powershell?view=powershell-6) and upgrade to the latest version of Windows Powershell 5.1.
We do not use Powershell 6 core for this course, but if you want to install it, you can without disrupting Windows Powershell 5.

## Script Storage and Backup/Version Control
You should already have a github repo for this course with your bash files. Clone your repo to your Windows machine. Create a folder in that repo clone folder to hold your powershell files. The easiest way to do this in windows is to use a github GUI tool.
