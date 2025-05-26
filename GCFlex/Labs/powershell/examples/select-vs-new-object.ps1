get-wmiobject win32_processor | % {
    new-object -type psobject -property @{
           caption = $_.caption
           manufacturer = $_.manufacturer
           "Speed" = [string]$_.maxclockspeed + "MHz"
           numberofcores = $_.numberofcores
           "L2 Cache" = if ($_.l2cachesize -eq $null)
                    { "no data" }
                 else
                    { [string]$_.l2cachesize + "KB" }
           l3cachesize = $_.l3cachesize
    }
}

get-wmiobject win32_processor |
    format-list caption,
           manufacturer,
           @{n="Speed";e={[string]$_.maxclockspeed + "MHz"}},
           numberofcores,
           @{
             n="L2 Cache";
             e={
                  if ($_.l2cachesize -eq $null)
                    { "no data" }
                 else
                    { [string]$_.l2cachesize + "KB" }
              }
           },
           l3cachesize