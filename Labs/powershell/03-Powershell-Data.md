# Lab 3 - Powershell Data
This lab is designed to give you practice working with objects and handling data.
Demonstration scripts which show how to create some of the things you will need for this lab are available [here](examples/tutorial-demos/). The ones for object exploration, dot notation, new-object, and pipeline object creation are helpful for this lab.

## Practice
Review and perform the exercises for each of the following from the presentation. Ensure you understand what they are doing before attempting the practice tasks.
 * Where-Object
 * Sort-Object
 * Select-Object
 * Script Blocks
 * Operators
 * Variables
 * Hash Notation for property creation

## Practice Tasks
### IP configuration report
1. Create a script which produces a report showing the ip configuration for the computer.
  * Use the get-ciminstance command as shown below to get a collection of network adapter configuration objects.
  * Use a pipeline with a where-object filter on the `ipenabled` property to only include enabled adapters in your report.
  * Your report output should be a table showing for each adapter that is configured: the adapter description, index, ip address(es), subnet mask(s), dns domain name, and dns server.
  * Use format-table to format your output and make it as clean and easy to read as possible. Ask yourself "What kind of report output would I want to have to read"?
```powershell
get-ciminstance win32_networkadapterconfiguration
```
1. Run your script, add features or additional output to it if you feel that will make your report more useful.
1. Push your script to your github repo

## Grading
This lab prepares you for the next lab and expands your scripting skills in preparation for lab 5 which is the only powershell lab that is marked.
