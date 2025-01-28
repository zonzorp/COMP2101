# COMP2101 - Administrative Shell Scripting
## Lab system setup for bash scripting

In this course, we will be creating, testing, and debugging shell scripts. It is good practice to develop software on a machine whose job it is to provide development tools. This is not always the same machine that your scripts will be deployed on. Your scripts should be written to work on any computer for which it is expected to be useful.

During the semester, as you do the labs, you will gain skills and learn new commands. We will be using [Github](https://github.com) to store scripts. Further down in this lab assignment's instructions are the details on how to set this up for this course.

Once you have completed a lab, you will be ready to write the Quiz for that lesson on [Blackboard](https://gc.blackboard.com) under **Quizzes**. If you write the quiz without doing the lab, you risk being unprepared to do well on the quiz.

### Prerequisites
The first portion of this course covers scripting with bash in Linux. You are expected to already have a firm grasp on using the bash command line for system management including file management and content creation. Students are expected to have completed the __COMP2018 Linux System Administration__ and __COMP1071 Linux Network Administration__ courses before taking this course. The first quiz in the course is the Bash Commands Quiz. It is a quiz which does not count towards your semester mark and may be written as many times as you wish. You must achieve a score of 70% of the Bash Commands Quiz before the rest of the course will become available for you on Blackboard.

### Scripting Environment
Scripting can be done with any tools that allow you to create text files, and any __terminal__ can be used to run your scripts. However, there are some very simple things you can set up to make life much easier for yourself when writing scripts.
* ensure you are using the current version of the shell, version 5 for bash, use ```bash --version``` to sheck your version
* use a Linux editor such as __gedit__ or __nano__ or __vim__ to write your scripts or the github website file editor, or n IDE such as vscodium, not a Windows tool like notepad
* comment your scripts verbosely
* frequently commit and push changes to [Github](https://github.com) so you can see the changes you have made as you have worked on your scripts
* test small changes to your scripts before making more changes, large changes are harder to debug
* use the shellcheck program to analyze your scripts for common mistakes

All of the lab instructions are deisgned and written for a VM running a current LTS version of Ubuntu Desktop Linux. It is used in this course because it is very popular and has a GUI to give us access to some graphical tools for writing and testing scripts. You can use a VM on your laptop, a hosted VM on a cloud service, remote access to your own Linux host at home, or a native Linux machine like a laptop, netbook, or pi. Be sure you have reliable access to whatever environment you wish to use. Unless specifically noted, all of our scripting will be done as an ordinary user. You do not need to use root privileges except as required by specific commands.

### Creating your development virtual machine
1. It is recommended that you install the current LTS Ubuntu desktop Linux in a new VM for this class. Ubuntu is used for the course demos and lab instruction examples. You can use that if you want your environment to look like the demos and lab instruction examples. Some students find Mint more familiar looking, some want to use a Kali VM. It doesn't matter for our purposes, but it does need to be a current release. Easy install is fine for our purposes. All of our command line work will be done in a __terminal__ window. If you want step-by-step instructions for installing a Ubuntu VM, you can use [Canonical's instructions for creating a Ubuntu VM](https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox). Whatever way you choose to create your VM, you MUST create and use a Ubuntu login account for your VM which has your name as the username and a computer hostname which is pcNNNNNNNNN where the NNNNNNNNN is your student number. If you need help doing this, ask the professor or refer to Canonical's website for help in setting a computer name or adding a user account.
1. Update the software on your machine and install shellcheck
```bash
sudo apt update
sudo apt install shellcheck
sudo apt upgrade
```

### Create or access your github account on github.com
1. Open your web browser and create a __github.com__ account, or you can re-use an existing github account if you have one (but it must be your own github account, not someone else's account)
  * Create a repo for this course, name it __COMP2101__
  * Unless you are experienced with github, **make sure to check the box to initialize your new repo with a README before clicking on create**
  * You should now see on the website that you have a repo with a single file in it named readme.txt
  * Use the [instructions on the github website to set up ssh keys](https://github.com/settings/keys) for accessing your github account


### Get a local copy of the repo to work on
1. In a terminal window, set your github defaults and create a clone of your github repository
```bash
cd
git config --global user.email you@yourdomain
git config --global user.name "Your Name"
git clone git@github.com:/yourgithubusername/COMP2101
```

### Make a place in your local copy of the repo for your bash scripts and change directory there to keep pathnames simple to type
1. Make a directory to hold bash scripts in your local copy of the repo and change to it
```bash
mkdir COMP2101/bash
cd COMP2101/bash
```
1. Ensure your version of bash is at least version 5
```bash
bash --version
```

## helloworld.sh - your first script this semester!

### Creating a simple shell script
We are going to make our first script now. It will be called helloworld.sh and the primary purpose of the script is to print out **Hello World!**. So our script's task is just to print out that string of text. The secondary purpose of this script is to get acquainted with the process for doing scripts that we will be using this semester. Each time we doa script, the process will be the same.

We will take this slowly, testing frequently as we go so that we can get accustomed to the practice of testing small changes frequently instead of making large changes without testing. Future labs won't have this level of detail in the instructions because the process is always the same as it is for this script.

There are two kinds of testing we will be using. The first is a static test to look for glaring syntax errors. For this, we run the **shellcheck** program on our file. The second is a dynamic test where we run our script and see what it does or doesn't do.

Once testing is complete, we will push our script to github. In this lab only, we will also modify that script on github and pull it back to our local machine, so you can see how that process works. We will only be intentionally doing that once this semester.

1. Change to the directory where you will be keeping your bash scripts to save typing out long pathnames throughout the lab
```bash
cd ~/COMP2101/bash/
```
1. Make a new empty file called **helloworld.sh**
```bash
touch helloworld.sh
```
1. Run __shellcheck__ on it
```bash
shellcheck helloworld.sh
```
1. You will see output telling you that the file has no command interpreter line to specify the shell to use
1. Add `#!/bin/bash` as the first line in your file to correct this problem - you can use an editor as mentioned above, or you can use a command line output redirect as shown below
1. Run **shellcheck** to make sure you didn't break your script
```bash
echo '#!/bin/bash' > helloworld.sh
shellcheck helloworld.sh
```
1. **shellcheck** shouldn't report any problems (no output from the shellcheck command means no problems found). However, we know it has no commands in it and wouldn't do anything if we were to run the script, so we need to add a command to make the script do its task which is to print out **Hello World!**.
1. Add `echo Hello World!` as the second line in your file - you can use an editor as mentioned above, or you can use a command line output redirect as shown below
1. Run **shellcheck** to make sure you didn't break your script
```
echo echo Hello World! >> helloworld.sh
shellcheck helloworld.sh
```
1. **shellcheck** shouldn't report any problems (no output from the shellcheck command means no problems found). So we are ready to test our script. Your script is just a text file so far. To tell the operating system that your script is supposed to be an executable program, change the permissions on the file.
```bash
chmod +x helloworld.sh
```
1. Run the script to see if it does what it should do, namely print out **Hello World!**. Shellcheck found no problems, but it only checks syntax. So we need to actually run the script to see if it does what it should do and only what it should do.
```bash
./helloworld.sh
```

### Update your online github repo with the work you have done on your local copy of the repo
1. Tell git to add the files which you want kept in your repo to the list of staged changes which could be sent to your online github repo
```bash
git add helloworld.sh
```
1. Run a git status to see what it shows when you have changes ready for a commit
```bash
git status
```
1. Commit your staged change with a suitable commit message, since we have no other files to add to our commit at this time
```bash
git commit -m "Created file"
```
1. Run a git status to see what it shows when you have changes committed
```bash
git status
```
1. Push your changes to the github website
```bash
git push
```
1. Run a git status to ensure your local files match the online repo
```bash
git status
```
1. Navigate in your web browser to verify you can see the helloworld.sh script file in the bash directory on the github website (it may take github a few minutes to show the changes, and your browser might need to reload the github web page)

### Updating the **helloworld.sh** file online and then bring the changes down to your own computer's clone of the repo
1. In your web browser, click on your **helloworld.sh** file to view the file content
1. Go into edit mode on the file by clicking on the **pencil icon**
1. Add a 3rd line to the file that just says **exit** and click on Commit changes at the bottom of the web page
1. Wait for a couple of minutes in case github is busy or slow
1. Use git's fetch command to get a state update and then git's status command to see if your local copy needs to be updated
   * repeat this step until it says you need to get the update from github
```bash
git fetch
git status
```
1. Update your local copy using the online repo
```bash
git pull
```

You are now ready to use __bash__ and __Github__ in an organized way to create simple shell scripts and save them with version history.

Now that you have set up your development machine, this is where you will create and test scripts. Once you have a script running to your satisfaction and your github repository updated, you can submit your work on blackboard.

## Setting up the Github Desktop tool
If you prefer to use a GUI for github, you can. These steps should install the github desktop tool and allow to you use it to manage your local clone of your repo

1. Download and install the github desktop package for debian
```bash
cd
wget https://github.com/shiftkey/desktop/releases/download/release-2.9.3-linux3/GitHubDesktop-linux-2.9.3-linux3.deb && sudo dpkg -i GitHubDesktop-linux-2.9.3-linux3.deb
```
1. Start the tool and pin it to your taskbar
1. Login to github in the tool (will start a browser to login)
1. Add your local clone of the repo in the tool
1. Explore the tool, or visit github.desktop.com for more info, demos, and such

## Create a snapshot of your virtual machine
This step is here so that you can have a backup of your working virtual machine with this lab finished, in case something bad happens in the future. If you are using a physical computer for your script writing, consider taking a backup of it for the same reason. The specific instructions here are for a VM running in VMWare.

1. Use the following command to properly shutdown your VM.
```bash
sudo poweroff
```
1. When the VM has finished shutting down, use your file manager to find the files for your VM, which typically will be in a directory called `Virtual Machines` in your home directory. Open the file for your vm called VMNAME.vmx and add the following line to the end of the file.
```bash
disk.EnableUUID = "TRUE"
```
1. Use the VM or Virtual Machine menu in VMWare to create a snapshot. You can create a snapshot after every lab is completed, so that if you mess something up, the worst impact is that you will have to go back to your snapshot and redo the current lab. If you don't have the snapshots, you will have to start back at lab 0 if you mess up your VM during the semester. Once you have made the snapshot, you can run the VM again in VMWare so that it is ready for use in the next lab. You do not need to keep multiple snapshots. You can delete the older one when you make a new one.

### Submitting your Lab Work
There is nothing to submit for this lab. This lab exists to create a useful environment for the rest of the course. Ask your professor for help to complete this lab before starting the next lessson in this course if you are unable to complete it on your own.

###### This document is copyright Dennis Simpson, 2013-2022.
