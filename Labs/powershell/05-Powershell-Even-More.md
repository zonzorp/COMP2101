# COMP2101 Powershell Lab 05 - Parameters and Modules
This lab is designed to familiarize you with adding parameters to powershell scripts and creating trivial modules.

## Modules
1. Create a module file with the name ModuleNNNNNNNNN where NNNNNNNNN is your own student number and install it in your personal modules folder under Documents/WindowsPowerShell/Modules/ModuleNNNNNNNNN
1. Copy all of the functions you have created for previous labs from your profile and report scripts to your new module, removing them from your profile when you do so
1. Start a new powershell window and make sure your functions still run by running each one on the command line
1. Run `get-module` to show your functions are coming from your module
1. Push your module file to your github repo

## Parameters
1. Make a new system report script using the script from lab 4, but with these changes and improvements:
   * It must accept but not require the following parameters on the command line:
      * -System   displays the cpu, OS, RAM, Video reports ony
      * -Disks    displays the disks report only
      * -Network  displays the network report only
   * If your script is run without any parameters, it should generate the full report with all sections included
1. Run your modified system report script 4 times at least to test it
   * with no parameters given on the command line
   * once for each parameter the script accepts
1. Push your improved system report script to your github repo with the name systemreport.ps1

## Grading
Run the following commands to demonstrate successful completion of the assignment, screenshots are needed unless you show them to the professor in person during class. Run this sequence in a new powershell window, and make your screenshots include the entire screen.
```powershell
gc $profile
get-module
get-command -module yourmodulename
systemreport
systemreport -system
systemreport -disks
systemreport -network
```

Submit a PDF with screenshots clearly showing your commands running in a powershell console window. No other file formats will be accepted. Put your github repo URL in the blackboard submission comments and ensure your repo contains your module file, your profile file, and your systemreport.ps1 script.
