get-wmiobject win32_diskdrive |
  where-object size -gt 0 |
  foreach-object { $disk = $_
      $disk.getrelated("win32_diskpartition") |
        foreach-object { $part = $_
            $part.getrelated("win32_logicaldisk") |
              foreach-object { new-object psobject -property @{
                                            Manufacturer = $disk.manufacturer
                                            Model = $disk.model
                                            FWRevision = $disk.firmwarerevision
                                            DiskSize = $disk.size/1000000000 -as [int]
                                            Partition = $part.deviceid
                                            PartitionSize = $part.size/1gb -as [int]
                                            DriveLetter = $_.deviceid
                                            "FSSize" = [string]($_.size/1gb -as [int]) +"GB"
                                            "FreeSpace" = [string]($_.freespace/1gb -as [int]) + "GB"
                                            "% Free" = [string]($_.freespace/$_.size *100 -as [int]) + "%"
                                           }
                }
          }
    } |
  format-table Manufacturer, Model, FWRevision, DiskSize, Partition, PartitionSize, DriveLetter, FSSize, FreeSpace, "% Free"
