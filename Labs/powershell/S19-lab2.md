# Lab 2 - Powershell Objects
This lab is designed to help you become familiar with creating and exploring objects.

## Object Display
These tasks will help you to become familiar with how Powershell by default displays any objects that are not intentionally sent anywhere on the command line.
1. Create a simple string object and let it be automatically displayed
```powershell
"Some string object"
```
1. Create an object using a cmdlet and let it be automatically displayed
```powershell
get-date
```
1. Create some object collections and let them be automatically displayed
```powershell
"string 1","string 2","string 3"
5,6,7,8,9
"string 1",456,(get-date),"string 2"
```

## Output Redirection
These tasks practice redirecting object display output to either save it or discard it instead of letting it show up on the screen.
1. Use shell output redirect to send the display output of a cmdlet to a file in a direcotry created to hold files created during this lab.
```powershell
mkdir $home/COMP2101/ps-lab2
get-date >$home/COMP2101/ps-lab2/mydate.txt
```
1. Use shell output redirection to send the display output of an object collection to a file.
```powershell
"chicken","tuna","rodent" >$home/COMP2101/ps-lab2/food
```
1. Create some directories on your system and notice how the cmdlet that makes a directory does not discard the directory object it creates.
```powershell
new-item -itemtype directory $home/COMP2101/ps-lab2/mydir1
new-item -itemtype directory $home/COMP2101/ps-lab2/mydir2
```
1. Create a directory and discard the output it made instead of letting it display.
```powershell
new-item -itemtype directory $home/COMP2101/ps-lab2/mydir3 | out-null
```
1. Use Windows Explorer to review the files and directories you have created.

## Aliases
These tasks will demonstrate how to create and use aliases in Powershell.
1. Run the get-alias cmdlet to display the pre-defined aliases in Powershell.
```powershell
get-alias
```
1. Review the list of pre-defined aliases. How many Linux commands do you see in the list?
1. The Linux `ls` command is an alias in the list. Try listing a directory using the `ls` function. Does it work the same as the Linux version?
```powershell
ls $home/COMP2101/ps-lab2
```
1. Try creating your own alias for notepad. Review the alias list to see if it shows up in the list. Try looking up just the alias you created by name. Try using it to start notepad. Quit the notepad window when it starts.
```powershell
new-item -path alias:np -value notepad
get-alias
get-alias np
np
```
1. Start another Powershell window. In the new window, display the list of aliases. Is your alias in the list? What does that tell you about aliases that you create?
1. Add a line to your powershell profile that creates the notepad alias.
1. Start a new powershell window and run the np command.

## Functions
These tasks will demonstrate how to create and use functions in Powershell.
1. Display a listing of the pre-defined functions in Powershell.
```powershell
ls function:
```
1. Review the list of pre-defined functions. How many Linux commands do you see in the list?
1. The Linux mkdir command is a function in the list. Try creating a directory using the mkdir function. Does it work the same as the Linux version?
```powershell
mkdir $home/COMP2101/ps-lab2/mydir4
```
1. Try viewing the script block inside the pre-defined function which implements the `help` command. In particular, what is the last line of the script block in the `help` function?
```powershell
get-content function:help
```
1. Create your own function. See if it shows up in the functions listing. Try viewing just your function on the functions drive and then display the script block content of your function. Use your function as a command.
```powershell
function myfunc {
"this is my function"
"it creates a couple of string objects and just lets them be displayed by default"
}
ls function:
ls function:myfunc
get-content function:myfunc
myfunc
```
1. Start another Powershell window. In the new window, display the list of functions. Is your function in the list? What does that tell you about functions that you create?
1. Modify your profile to create and run a function which displays a welcome message like the one from the bash labs. You can get sample code for displaying the welcome message from [welcome-profile.ps1](examples/welcome-profile.ps1). Name your function **welcome**.

## Out verb cmdlets
The out verb is used for several cmdlets which can be helpful in saving or displaying or destroying objects at the end of a pipeline.
1. Try each of the commands on the "Out Verb Cmdlets Exercises" slide from the presentation.

## Pipelines
Pipelines are extremely common and useful in Powershell. These tasks will give you practice building and using them.
1. Use a pipeline to view long output one screenful at a time.
```powershell
ls function: | more
get-alias | more
```
1. Use a pipeline to modify the ordering of objects passing through the pipeline, and then display the output on screenful at a time.
```powershell
get-process
get-process | sort cpu
get-process | sort cpu |more
```
1. Objects pass through the pipeline from left to right. The ordering of commands in a pipeline is very important. What happens if you change the order of commands in a pipeline? Can you explain any differences in output between these two pipelines?
```powershell
get-process | sort cpu | select -last 10
get-process | select -last 10 | sort cpu
```

## Object Exploration
We can explore objects using Powershell. It can be very useful to know the structure of an object as well as to see what can be found in the properties of objects we create.
1. Create a host object. This object contains information and code related to our current Powershell process. When we use the `get-host` cmdlet to create this object and don't do anything with that object, it gets displayed in the default format for that object type, which is what happens to objects which "fall off the end of the command line".
```powershell
get-host
```
1. Pipe the host object to the get-member cmdlet to see what that object contains that we can see or use. The list may be onger than you expected. Try viewing just the methods of the object. Try viewing just the properties of the object.
```powershell
get-host | get-member
get-host | get-member -membertype method
get-host | get-member -membertype property
```
1. Try the same exercise with the object from the `get-date` cmdlet. Note that the default display format of this object type is quite different than the display format of the host object. The datetime object has multiple types of properties, so try viewing both the simple properties list and the complete properties list.
```powershell
get-date
get-date | get-member
get-date | get-member -membertype method
get-date | get-member -membertype property
```
1. For both the previous objects, you should see that there are quite a few data properties in the objects which are not displayed by the default object display format. More complex objects do this to a much greater degree. Try viewing process objects produced by `get-process`, `ps`, and `get-wmiobject -class win32_process` to see what the default outputs look like.
```powershell
get-process
ps
get-wmiobject -class win32_process
```
1. Try viewing the object member for each of these to see what they look like. Do all 3 commands produce the same types of objects?
```powershell
ps | get-member | more
get-wmiobject -class win32_process | get-member | more
```
1. `Get-member` is very useful to find out what is supposed to be in an object for us to access and use. However, not all object properties have data or get used. To view the data saved in the properties of an object, we can use the `format-list` cmdlet and simply tell it to show us all properties. Try this with some of the objects we have been using so far to see which properties have data in them and which are empty or unused.
```powershell
get-host | format-list *
get-date | format-list *
get-process | format-list * | more
get-wmiobject -class win32_process | format-list * | more
```

## Dot Notation
Dot notation allows us to access the members of an object. We can retrieve or set the properties of an object, and we can invoke methods in an object to make it perform tasks for us.
1. Try each of the commands on the "Dot Notation Exercises" slide from the presentation.

## Custom Objects
Custom objects provide a way to make objects that contain whatever data we find useful. It's kind of like being able to have variables with super powers. Custom objects can be built on top of any existing object types.
1. Try the examples on the "Custom Objects Examples" slide from the presentation, save the script that generates the numbers chart, call it geeknumbers.ps1, and modify it to show up to 8 lines instead of the default 4.
1. Run your modified script to make sure it works.

## Grading
When you have the lab done, be prepared to do the following in person to get your marks.
1. Start a new powershell window. It should display your welcome message and not show any output from creating the notepad alias.
1. Run `ls alias:np` and it should show your existing np alias for notepad.
1. Run `cat function:welcome` and it should show the content of your welcome function.
1. Run `geeknumbers.ps1` and it should show the 8 line table of powers of 2, 8, and 16.
