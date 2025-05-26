$adapters = Get-CIMInstance CIM_NetworkAdapter
$filteredadapters = $adapters | where-object {$_.adaptertype -match "ethernet" -and $_.netenabled -eq $true}
$myNetworkObjects = $filteredadapters |
                      foreach { $adapter = $_;
                                $nac = $adapter | Get-CIMASsociatedInstance -resultclassname Win32_NetworkAdapterConfiguration;
                                New-Object PSObject -Property @{Name=$adapter.name;
                                                                IPAddress=$nac.ipaddress;
                                                                Gateway=$nac.defaultipgateway;
                                                                ConnectionName=$adapter.netconnectionid;
                                                                "Speed(Mbps)"=$adapter.speed / 1000000
                                                               }
                              }
 $myNetworkObjects | format-table Name, ConnectionName, IPAddress, Gateway, "Speed(Mbps)"
