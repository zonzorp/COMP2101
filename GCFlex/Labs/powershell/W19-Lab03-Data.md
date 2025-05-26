# Lab 3 - Powershell Data
This lab is designed to give you practice working with objects and handling data.
Demonstration scripts which show how to create some of the things you will need for this lab are available [here](examples/tutorial-demos/). The ones for object exploration, dot notation, new-object, and pipeline object creation are helpful for this lab.

## Practice
Review and perform the exercises for each of the following from the presentation. Ensure you understand what they are doing before attempting the assignment tasks.
 * Where-Object
 * Sort-Object
 * Select-Object
 * Script Blocks
 * Operators
 * Variables
 * Hash Notation for property creation

## Assignment
### Powershell system identification report
Download the powershell [systemid.ps1](examples/systemid.ps1) script. Run it to see what it does; it should produce similar output to the bash systemid script from earlier in the semester. Make 2 improvements to the script.
  * Using the Microsoft-specific name lookup method from the System.Net.Dns class works for getting fake names for a machine which has no DNS names. But it doesn't work for IP addresses that aren't tied to Microsoft-specific name management. Modify the command which gets a hostname for the external ip address so that it gets a real name from the real DNS. Use the nslookup command.
  * Modify the assignment of the IP address object collection (Get-NetIPAddress) so that it pipes to a where-object command which filters out localhost. You must use the where-object command to get the marks for this task.
  
### Powershell disk usage report
Create a script which produces a report showing the space usage for the filesystems in the computer.
  * Use the get-wmiobject command as shown below to get a collection disk filesystem objects.
  * Only include filesystems which have a non-zero size. Use a pipeline with a where-object filter.
  * Your report must be a table showing only the filesystem drive letter, size of filesystem, free space, and providername.
  * Use format-table to format your output and your numbers must be human-friendly.
```powershell
get-wmiobject -class win32_logicaldisk
```

### Powershell memory report
Create a script which produces a RAM report showing the physical memory installed in the system.
  * Use the get-wmiobject command as shown below to get a collection of memory device objects.
  * Your report must be a table which only shows device manufacturer, capacity, bank and slot. Use format-table to format your output.
  * The capacity in your output must be in MB, not bytes. You will need to use hash notation to create suitable output property.
```powershell
get-wmiobject -class win32_physicalmemory
```

### Powershell software report
Create a script which shows the non-Microsoft software installed on the system.
  * Use the get-wmiobject command as shown below to get a collection of software product objects.
  * Your output must be sorted by the install date of each software product.
  * Your report must be a table with columns for software name, vendor, version, and install date only. Use format-table to format your output.
```powershell
gwmi -class win32_product -filter "vendor!='Microsoft Corporation'"
```

