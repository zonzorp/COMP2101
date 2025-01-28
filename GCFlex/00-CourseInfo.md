# COMP2101 Administrative Shell Scripting

**COVID-19 Effect: The class schedule that describes virtual class meeting dates and times during which students can ask questions, get help, or discuss submissions or grades is kept on [Blackboard](https://gc.blackboard.com). The first virtual class of the semester will begin with a discussion about the details of how the course runs in a particular semester and what college resources and processes apply to the course. It is mandatory to virtually attend the first class of the semester.**

## Prerequisites
This course is designed for students who have completed the [Linux System Administration](/COMP2018) and [Linux Network Administration](/COMP1071) courses, along with several similar courses for Windows. Half of this course involves learning scripting using the Linux bash shell, the other half explores learning to create reusable scripts with Windows PowerShell. Students are not expected to have scripting knowledge or experience prior to starting this course, other than the single introductory lesson which is part of the [Linux System Administration course](/COMP2018).

Students are expected to be familiar with the bash command line, basic Linux command line utilities for data and file handling as well as file editing (these skills are covered in the [Linux System Administration](/COMP2018)). To demonstrate preparedness, students must score 75% on the bash commands quiz on [Blackboard](https://gc.blackboard.com) in order to proceed with the course. Ideally students will complete this quiz before the end of the first class of the course.

Students are expected to be familiar with how to install and start applications, and how to create and edit plain text fles, in Windows. There is no preparedness quiz for Windows skills.


## Course Content
* Scripting
  * Variables
  * Expressions, strings, and pattern matching
  * Functions
  * Debugging
  * Shell script elements (commands, comments, and exit)
  * Error trapping and handling
* Writing and executing scripts
  * Conditional program execution (if/else/case/while/for)
  * Working with files
  * Parameter handling
  * Processing arrays
* Linux Specifics
  * Basics of bash scripting
  * Script execution and permissions
  * Customizing bash
* Windows Scripting
  * Basics of PowerShell
  * Customizing the PowerShell interface
  * PowerShell commands and cmdlets
  * Customize output using PowerShell Formatting
  * Using Windows Management Instrumentation (WMI) from Windows PowerShell
  * Manage Active Directory users and groups
  * Manage computers and other Active Directory objects
  * Script execution and permissions
  * Modules

## Course Delivery and Expected Activities
The general sequence of activity when taking this course is to do the following for each lesson:
1. Attend the class, or review the presentation slides and videos, noting that the slides may have been updated since they were used in the videos; the slides will always be updated more frequently than the videos
1. Do the lab assignment and save your work to your github repo - details on lab workflow are further down this webpage
1. Submit the URL for your github repo and one or more screenshots of your script running on your computer to blackboard for the completed assignment item
1. Do the quiz

There is a [brief document describing how to succeed in this course](howToSucceedInThisCourse.html) that students can review before and during the course to maximize the results of their activities and efforts.

## Required Software and Documentation
There is no textbook for this course. Online help and documentation provide the reference material.

Ubuntu 20.04LTS is the recommended platform for the Linux lab exercises. It can be run natively on a PC, Raspberry Pi, or other computer system, or in a virtual machine, also known as a VM.

Windows 10 is the recommended platform for the Windows lab exercises. It can be run natively on a PC, or in a VM.

To use VMs, these links may be helpful to get started.
* [VMWare](https://vmware.com)
* [Virtualbox](https://www.virtualbox.org) which is free from Oracle
* [VMWare OVA archive file for a Ubuntu desktop developer VM](https://zonzorp.net/gc/COMP2101-21W-desktop.ova) (about 7.5GB) which can be imported into VMWare or Virtualbox to have a suitable Linux environment for the course

If another OS environment is chosen by the student, they may encounter challenges not covered by the course material. The professor is available in class to help with these, but students may have difficulty completing the course labs if their chosen environment is lacking tools.

## Checking readiness to start scripting

Follow the instructions in the first lab [Linux System Setup for bash Scripting](Labs/bash/BashScriptingSetup.html). The lab instructions describe what to submit to [Blackboard](https://gc.blackboard.com) under Assignments & Test, subdirectory Bash, Lab System Setup". This lab must be submitted to Blackboard before you can proceed in the course. It is marked. The mark for it is not counted towards the semester grade. It is intended to allow students to become familiar with the lab workflow and submission process in this course.

### Working with your script files for this course
You will be using a github.com repository to keep your scripts on. We use it to provide you with change records and backups of your work. If you already have a github.com account, you can use that. Otherwise create a free account on github.com and create a repository named COMP2101.
 
You can use any text editor you like to create, modify, and manage your script files for this course. You can edit them on github's website if you wish, but you would then need to always pull your changes to your local computer to test and run your scripts.

To be marked, your scripts must be available on your own github repo named COMP2101. Github can use SSH for repo updates. Follow the instructions on the github.com website to add your ssh public key for your github account to both your Linux and Windows lab machines.

On both your Linux and Windows systems, clone your github repo before beginning your first scripting lab. You only need to do this if you do not already have a clone of your repo on the computer on which you are going to do your lab work.
```bash
git clone git@github.com:/yourgithubusername/COMP2101 ~/COMP2101
```

If you want to get rid of your local clone of the repo for any reason (like it is messed up, you are changing what computer you want to work on, etc.), you can just delete your local copy without affecting your online copy on the github.com website. On Linux, you can delete your COMP2101 folder using File Manager, or use the command line to run `rm -f ~/COMP2101`. On Windows, delete it using File Explorer. By the end of the course, you'll be able to write a script that can remove a folder on the command line.

### General Lab workflow
Regardless of whether you are doing Linux or Windows labs, the workflow is the same.
1. Ensure you have a current copy of your repo
```bash
cd ~/COMP2101
git pull
```
1. Create and test your script in the appropriate subdirectory of your cloned repo following the instructions for the lab on the course website on github
1. Push the script(s) to github using a GUI tool or the git command line when you are done working on it (you may not be completely finished with it, just stopping work on it for the time being)
```bash
cd ~/COMP2101
git add scriptfilepath
git commit -m "description of what you are updating"
git push
```
1. You can continue to work on it at different times. Get into the habit of pushing it to github each time you stop work.
1. When the lab is completely finished, submit the github URL for your repo to the lab assignment item on Blackboard so I know to check your repo and mark your work

## External Resources for bash - provided as a convenience only, none of these are required for this course
These resources may be helpful, but are not a required part of the course.
* [Ryans Tutorials Linux Tutorial](http://ryanstutorials.net/linuxtutorial)
* [The UNIX Workbench ebook - fairly complete book on shell use for programmers](https://seankross.com/the-unix-workbench/)
* [Explain Shell Commands](http://explainshell.com)
* [Really basic shell command examples on edumotivation.com](https://edumotivation.com/category/linux/basic-commands/)
* Tutorials from likegeeks.com
  * [Regular Expressions](https://likegeeks.com/regex-tutorial-linux/)
  * [Using the find command](https://likegeeks.com/linux-find-command/)
  * [Using the grep command](https://likegeeks.com/grep-command-in-linux/)
  * [Various Basic Scripting Things](https://likegeeks.com/bash-script-easy-guide/)
  * [Input, Output, and Redirection](https://likegeeks.com/shell-scripting-awesome-guide-part4)
  * [Loops, Command Substitution, Input Field Separator, Loop I/O Redirection](https://likegeeks.com/bash-scripting-step-step-part2/)
  * [Command line arguments and reading user input](https://likegeeks.com/linux-bash-scripting-awesome-guide-part3/)
* [How to setup Ubuntu using WSL in Windows 10](https://www.windowscentral.com/install-windows-subsystem-linux-windows-10)
* [Posh Code Style Guide](https://github.com/PoshCode/PowerShellPracticeAndStyle/blob/master/TableOfContents.md)
* [GNU bash Docs](http://www.gnu.org/software/bash/)
* [Wikipedia bash info](http://en.wikipedia.org/wiki/Bash_\(Unix_shell\))
* [TLDP Bash Beginners Guide](http://www.tldp.org/LDP/Bash-Beginners-Guide/Bash-Beginners-Guide.pdf)
* [TLDP Advanced Bash Scripting Guide](http://tldp.org/LDP/abs/html/index.html)
* [sed Tutorial](http://www.thegeekstuff.com/2009/09/unix-sed-tutorial-printing-file-lines-using-address-and-patterns/)
* [awk Tutorial](http://www.thegeekstuff.com/2010/01/awk-introduction-tutorial-7-awk-print-examples/)
* [bash self-test game](http://overthewire.org/wargames/bandit)
