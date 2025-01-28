#!/bin/bash
# This script displays some host identification information for a simple Linux machine

# The LAN info uses a hardcoded interface name of "eno1"
# All data is found before generating any output

# TASK 1: Put the information gathering and report generation commands into a loop
#             so that the report is generated for every interface on the computer, not just one IPV4 LAN interface
#             and the external and routing information only appears after all interfaces are reported on
#             You can put the data into an array then generate the report, or you can just save the output in a
#             variable until you have it all ready
# TASK 2: Put the commands that work with addresses for each interface into a loop
#             so that the information is gathered for every address the interface has, including IPV6 addresses
# TASK 3: If an interface has no addresses configured for an interface, skip that interface
# TASK 4: If a name doesn't exist for a configured address or network number,
#             just display the address or network number without a name
# TASK 5: If the curl command is not installed, check for the wget command
#            If neither is available, don't try to generate the external ID
#            and instead print out a message telling the user you cannot get the external ID unless
#            they install the curl or wget command

# we use the hostname command to get our system name
sysname=$(hostname)

# the LAN address is extracted from the ip command output
# the LAN name is looked up using the LAN address in case it is different from the system name
lanv4address=$(ip -br address show eno1|awk '{print $3}'|sed 's,/.*,,')
lanv4name=$(getent hosts $lanv4address|awk '{print $2}')

# finding external information relies on curl being installed and relies on live internet connection
extv4address=$(curl -s icanhazip.com)
extv4name=$(getent hosts `curl -s icanhazip.com` | awk '{print $2}')

# default router comes from the route table
defaultrouteraddress=$(ip route list default|awk '{print $3}')
defaultroutername=$(getent hosts $defaultrouter|awk '{print $2}')

# network name is looked up in the networks table which may not have anything in it
networknumber=$(ip route list scope link|grep -w eno1|sed 's,/.*,,')
networkname=$(getent networks $networknumber|awk '{print $1}')

echo "
Hostname       : $sysname
LAN V4 ID      : $lanv4name ($lanv4address)
External V4 ID : $extv4name ($extv4address)
Default Route  : $defaultroutername ($defaultrouteraddress)
Network Name   : $networkname ($networknumber)
"

