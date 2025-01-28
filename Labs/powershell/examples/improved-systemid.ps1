# COMP2101 Powershell - systemid

if (! (get-ciminstance cim_operatingsystem).version.major -ne 10) {
  Write-Error "This script is only tested to work for Windows 10"
  exit
}

function get-ipname() {
  param([parameter(Mandatory=$true)][string]$ipaddr)
  try {[System.Net.Dns]::GetHostEntry($ipaddress).hostname} catch {write-warning "Could not get host entry for $ipaddress"}
}
$hostname = hostname
$os = get-ciminstance cim_operatingsystem
$osdescription = $os.manufacturer + " " + $os.caption + " (version " + $os.version + ")"
$cs = get-ciminstance cim_computersystem
$hardware = $cs.manufacturer + " (model " + $cs.model +")"
$netipaddresses = Get-NetIPAddress -AddressFamily IPV4
$webclient = new-object System.Net.Webclient
$extipaddress = $webclient.DownloadString("http://icanhazip.com").trim()
$extdnsobject = try {[System.Net.Dns]::GetHostByAddress($extipaddress)} catch {write-warning "Could not get host by address for $extipaddress"}
$extname = $extdnsobject.hostname
$ids = $netipaddresses | foreach-object {$netip = $_
                            $ifname = (get-netadapter |where-object ifindex -eq $netip.interfaceindex).interfacedescription
                            if (! $ifname ) { $ifname = $netip.interfacealias }
                            $ipname = try {[System.Net.Dns]::GetHostEntry($netip.ipaddress).hostname} catch {"No hostname"}
                            new-object psobject -property @{IPAddress = $netip.ipaddress
                                                            HostName = $ipname
                                                            Interface = $ifname
                                                            }
                         }
$ids += new-object psobject -property @{IPAddress = $extipaddress
                                        HostName = $extname
                                        Interface = "Internet"}
"
Hostname:     $hostname
OS Version:   $osdescription
System Model: $hardware"
$ids | format-table Hostname, IPAddress, Interface

