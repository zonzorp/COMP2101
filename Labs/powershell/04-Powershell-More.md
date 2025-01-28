# COMP2101 Powershell Lab 04 - Loops and WMI
This lab is designed to familiarize you with execution control and using the WMI/CIM interface.

## WMI Objects
1. Create a system information script to report several items of information about the running system
  * Include the system hardware description (win32_computersystem)
  * Include the operating system name and version number (win32_operatingsystem)
  * Include processor description with speed, number of cores, and sizes of the L1, L2, and L3 caches if they are present (win32_processor)
  * Include a summary of the RAM installed with the vendor, description, size, and bank and slot for each DIMM as a table and the total RAM installed in the computer as a summary line after the table (win32_physicalmemory)
  * Include a summary of the physical disk drives with their vendor, model, size, and space usage (size, free space, and percentage free) of the logical disks on them as a single table with one logical disk per output line (win32_diskdrive, win32_diskpartition, win32_logicaldisk). You will need to use a nested foreach something like this:
  
  ```powershell
  $diskdrives = Get-CIMInstance CIM_diskdrive

  foreach ($disk in $diskdrives) {
      $partitions = $disk|get-cimassociatedinstance -resultclassname CIM_diskpartition
      foreach ($partition in $partitions) {
            $logicaldisks = $partition | get-cimassociatedinstance -resultclassname CIM_logicaldisk
            foreach ($logicaldisk in $logicaldisks) {
                     new-object -typename psobject -property @{Manufacturer=$disk.Manufacturer
                                                               Location=$partition.deviceid
                                                               Drive=$logicaldisk.deviceid
                                                               "Size(GB)"=$logicaldisk.size / 1gb -as [int]
                                                               }
           }
      }
  }
  ```
  
  * Include your network adapter configuration report from lab 3
  * Include the video card vendor, description, and current screen resolution in this format: `horizontalpixels x verticalpixels` (win32_videocontroller)
  
1. Your report should be a single report, with separate sections for each bullet in the list above and each section should have a clear title
1. Numbers must be human friendly and empty properties/objects should be marked as `data unavailable` or `N/A` or something similar, do not just leave them blank
1. The memory, disk, and network sections should be presented in table format, the rest in list format
1. Each of the sections should use a function you create to gather the necessary objects for your output
1. Run your system report and push your final version to github

## Grading
This lab prepares you for the next lab and expands your scripting skills in preparation for lab 5 which is the only powershell lab that is marked.
