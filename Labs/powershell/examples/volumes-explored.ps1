gwmi win32_diskpartition |
    where size -gt 0 |
    foreach {$partition = $_
             $diskdrive = $partition.getrelated("win32_diskdrive")
             $logicaldisk = $partition.getrelated("win32_logicaldisk")
             if ($logicaldisk.deviceid) {
                    $ldname = $logicaldisk.deviceid
                    $volname = $logicaldisk.getrelated("cim_logicalfile").getrelated("win32_volume").name
             } else {
                    $ldname="unallocated"
                    $volname="none"
             }
             new-object -typename psobject -property @{partition=$partition.deviceid
                           size=$partition.size
                           drive=$diskdrive.deviceid
                           logicaldisk=$ldname
                           freespace=$logicaldisk.freespace
                           volume=$volname
                           fstype=$logicaldisk.filesystem}
                                                      
            } |
    ft -AutoSize partition, drive, logicaldisk,
                 @{n="Size     ";e={[math]::Round($partition.size/1MB,2).ToString()+"MB"}},
                 @{n="Freespace     ";e={if ($logicaldisk.freespace -ge 0) { [math]::Round($logicaldisk.freespace/1GB,2).ToString()+"GB"}}},
                 volume, fstype
