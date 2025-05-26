$totalcapacity = 0                                    # Start with a total RAM capacity of zero

get-wmiobject -class win32_physicalmemory |           # Get the physical memory objects
    foreach {                                         # Pipe them to foreach so we can create new object with the properties we want and add up the capacities
        new-object -TypeName psobject -Property @{    # Make a new object for each incoming memory object
            Manufacturer = $_.manufacturer
            "Speed(MHz)" = $_.speed
            "Size(MB)" = $_.capacity/1mb
            Bank = $_.banklabel
            Slot = $_.devicelocator
        }                                             # New object made with custom properties
        $totalcapacity += $_.capacity/1mb             # Add the current memory device object capacity to our running total
    } |                                               # Do the object creation and capacity accumulation for all the memory device objects
    format-table -auto Manufacturer,                  # Pipe the custom objects to a format-table to print them
                       "Size(MB)",
                       "Speed(MHz)",
                       Bank,
                       Slot

"Total RAM: ${totalcapacity}MB "                      # Display the total capacity obtained from adding all the memory device capacities up
