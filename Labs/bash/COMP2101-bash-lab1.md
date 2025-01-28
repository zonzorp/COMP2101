# Lab 1: bash Beginner Scripting

The purpose of this lab is to familiarize you with creating and running trivial scripts.

Skills exercised include basic file manipulation, permissions, script content, and comments. There are reflection questions throughout the lab which are not graded. They are there to help you self-assess whether you understand the content of the lesson. If you are unable to answer them, or are unsure of whether you can, discuss them with your professor or your classmates. Some of them will be on the tests for this course.

This lab is not graded and does not count towards your semester mark. It does however provide you with skills and knowledge which you will need to be successful writing the quiz for this topic as well as providing you with some content which you will need for your Bash Assignment which is graded.

## First Scripts
* Create all 3 of the hello world scripts from the presentation in the bash directory of your local copy of your github repository (~/COMP2101/bash). Be sure to name your files with a **.sh** extension so that GUI tools know to highlight the bash syntax. These 3 files are downloadable at [helloworld.sh](scripts-lab1/helloworld.sh), [helloworldtemplated.sh](scripts-lab1/helloworldtemplated.sh), and [helloworldugly.sh](scripts-lab1/helloworldugly.sh).

```bash
#!/bin/bash
# My first script - helloworld.sh

echo 'Hello World!'
echo "I am process # $$"
```
```bash
#!/bin/bash
# My second script - helloworldtemplated.sh

cat <<EOF
Hello World!
I am process # $$
EOF
```
```bash
#!/bin/bash
# My third script - helloworldugly.sh
# This script displays the string “Hello World!”

# This is a silly way of creating the output text by starting with something else and stream editing it in a pipeline
echo -n "helb wold" |
  sed -e "s/b/o/g" -e "s/l/ll/" -e "s/ol/orl/" |
  tr "h" "H"|
  tr "w" "W"|
  awk '{print $1 "\x20" $2 "\41"}'
bc <<< "(($$ * 4 - 24)/2 + 12)/2" |
  sed 's/^/I am process # /'
```
#### Run all three scripts by giving the script names to bash on the command line.
```bash
bash helloworld.sh
bash helloworldtemplated.sh
bash helloworldugly.sh
```

#### More script execution methods
You have run scripts by telling bash to read the files. Now you can try the other ways to run scripts.
1. Use the **ps** command to identify your current **bash** shell's process id (pid).

```bash
ps
```
1. Run your **helloworld.sh** script using the **bash** command directly.

```bash
bash helloworld.sh
```
What process id does your script say it has? This is the process id of the **bash** shell that ran your script commands. Is it the same shell process as the one you are typing commands into, or is it a different shell process?
1. Make your script executable, then run it by typing the pathname for it.

```bash
chmod +x helloworld.sh
./helloworld.sh
```
What process id does your script say it has? This is the process id of the **bash** shell that ran your script commands. Is it the same shell as the one you are typing commands into, or is it a different shell?
1. Now try running your script using the **source** command.

```bash
source helloworld.sh
```
What process id does your script say it has? This is the process id of the **bash** shell that ran your script commands. Is it the same shell process as the one you are typing commands into, or is it a different shell process?

## Script storage
1. Run

```bash
echo $PATH
```
to view your current command path, and check if it already includes your github bash directory ( **~/COMP2101/bash**  or **/home/yourusername/COMP2101/bash**).
1. If it doesn't include the directory for your bash scripts inside your local copy of your github repository, modify your **.bashrc** file to add that directory to your **PATH** variable.

```bash
vi ~/.bashrc
```
If you had to add the directory to your path, source your **.bashrc** file now.

```bash
source ~/.bashrc
```
1. Verify that you can now run your script just by typing its name, and that command name completion works with the Tab key.

```bash
helloworld.sh
```

# Challenge Script:
## sysinfo.sh - a script to display information about a computer

Your task is to create a script named **sysinfo.sh** and to run it on your Linux computer. Be sure you test it and update your github site with your finished script.

### sysinfo.sh
The purpose of this script is to display some important identity information about a computer so that you can see that information quickly and concisely, without having to enter multiple commands or remember multiple command options. It is a typical script in that it is intended to be useful, time and labour saving, and easily used by any user of the computer regardless of whether they know or understand any of the commands in your script. Your output does not need to be fancy or concise for this first script as we will be improving the output in the next lab. Each output item needs to be labelled. The following output information is required:
* The system's fully-qualified domain name (FQDN), e.g. myvm.home.arpa from a command such as hostname
* The operating system name and version, identifying the Linux distro in use from a command such as hostnamectl
* Any IP addresses the machine has that are not on the 127 network (do not include ones that start with 127) from a command such as hostname
* The amount of space available in only the root filesystem, displayed as a human-friendly number from a command such as df

#### Example run with output (your output does not need to match this exactly, just be sure to include the items described above):
```
$ ./sysinfo.sh 
FQDN: myvm.home.arpa
Host Information:
   Static hostname: zubu
         Icon name: computer-desktop
           Chassis: desktop
        Machine ID: 80d56744f22ea8e92e4e21805c0befd8
           Boot ID: 003a1ad47a6c4d68b173af5fc91b23ba
  Operating System: Ubuntu 18.04.6 LTS
            Kernel: Linux 4.15.0-184-generic
      Architecture: x86-64
IP Addresses:
192.168.0.16 2603:9001:6b01:fb00:7c5b:ff5:2a41:db77 2603:9001:6b01:fb00:21c:42ff:fe48:ce1a 
Root Filesystem Status:
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        12G  5.6G  5.6G  50% /
```

#### What to put in your script:
You can use whatever commands you like to create your script, as long as the data in the output is generated dynamically when the script is run and not hard-coded into the script. Ensure your script begins with the command interpreter specification (#!/bin/bash), and has sufficient comments to explain what the script is doing and how it does it. Here is a list of some of the commands you might find useful in your script to generate the necessary output. You can use whatever commands you like, but you need to keep your output labelled, concise, and easy to read. Your work must be your own. Work copied from the internet or from another student will not be accepted.
```bash
echo
hostname
hostnamectl
grep
df
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
There is nothing to submit for this lab. This lab exists to create a useful script and learn to use some important commands. It will provide the basis for the Bash Assignment later in the course which does count towards your semester mark. Ask your professor for help to complete this lab before starting the next lessson in this course if you are unable to complete it on your own.


###### This document is copyright Dennis Simpson, 2013-2023.
