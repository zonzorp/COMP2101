# COMP2101 Powershell Lab 05 - Input
The purpose of this lab is to familiarize you with using parameters an getting input from the user.

## Parameters
Create a script named `permissions-tester.ps1` that has the following parameters
  1. require a parameter named path which can have a filename in it
  1. accept the common parameters
     * use the write-verbose cmdlet to tell the user if the filename they specified belongs to them or not
     * use the write-debug cmdlet to display the value of the path parameter
  1. if the file does not exist, display an error with write-error and then exit
  1. ask the user interactively if they want to test for read or write
     * if they indicate read, tell them if the path they gave on the command line is for a readable file
     * if they indicate write, tell them if the path they gave on the command line is for a writable file

## Grading
Submit a single pdf file with a screenshot showing your script in an editing window (e.g. in ISE, notepad, or any other editor you like), and a screenshot with a sample of running it successfully for both the read and write test in a console window.
