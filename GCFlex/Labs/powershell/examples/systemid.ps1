# Lab 3 COMP2101 Powershell - systemid
#

$hostname = hostname
$ipinfo = Get-NetIPAddress -AddressFamily IPV4|
                      select-object ipaddress, @{n="hostname";e={try {[System.Net.Dns]::GetHostEntry($_.ipaddress).hostname}
                                                          catch {write-warning "Could not get host entry for $extipaddress"}
                                                          }
                                         }
$extipaddress = (invoke-webrequest icanhazip.com).content
$extname = try {[System.Net.Dns]::GetHostEntry($extipaddress).hostname}
           catch {write-warning "Could not get host entry for $extipaddress"}

"
Hostname:          $hostname
$ipinfo
External IP:       $extipaddress
External Hostname: $extname
"
