$ethernetAdapters = Get-WmiObject Win32_NetworkAdapter |             # store the network adapter objects in a temporary variable for clarity
    where-object adaptertype -match "ethernet"                       # filter out anything that does not have 'ethernet' in the description

$configuredadapters = foreach ($adapter in $ethernetAdapters) {      # use foreach to run a scriptblock on each object in the saved adapters collection, put each object in the '$adapter' variable for use in the script block, and save the output of the script block in a variable
    
    $nac = $adapter.GetRelated('Win32_NetworkAdapterConfiguration')  # use the WMI getrelated method to retrieve the configuration object for the adapter and store it in the 'nac' variable
    
    New-Object PSObject -Property @{                                 # create a new object for our output with properties built from both the adapter object and the configuration object for that adapter
        Index = $adapter.Index
        DHCPEnabled = $nac.DHCPEnabled                               # some of our custom properties are drawn directly from the source objects
        DHCPServer = $nac.dhcpserver
        DHCPLeased = $nac.dhcpleaseobtained
        DHCPExpired = $nac.dhcpleaseexpired
        IP = $nac.IPAddress|? {$_.indexof('.') -gt 0}                # some of our custom properties are only drawn from the source object if it has what we expect in it
        NetconnectionID = $adapter.NetconnectionID
        Name = $adapter.name
        MAC = $adapter.macaddress
        "Speed(Mb)" = $adapter.speed/1000000 -as [int]               # the speed custom property is built by dividing the speed in bits per second from the adapter object by 1 million and has a property name that must be quoted because it contains special characters
        GW = $nac.defaultipgateway
        Netmask = $nac.ipsubnet|? {$_.indexof('.') -gt 0}
        Domain = $nac.dnsdomain
        Hostname = $nac.dnshostname
        "DNS Servers" = $nac.dnsserversearchorder                    # has a property name that must be quoted because it contains special characters
    }

}

$configuredadapters |
    Format-List Name,                                                # our custom object properties don't fit in a table unless your window is very wide, so we format those objects as a list
                MAC,
                "Speed(Mb)",
                IP,
                Netmask,
                GW,
                Domain,
                Hostname,
                "DNS Servers"