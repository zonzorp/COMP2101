#!/bin/bash
# this script enumerates our interfaces and
# - displays their configured IPV4 addresses and names
# - or informs us they don't have one if appropriate
# - displays their interface speeds

# TASK 1: Add IPV6 information to the address reporting
# TASK 2: Improve the output quality to better deal with missing information

#############
# VARIABLES #
#############
interface_names=(`ifconfig |grep '^[A-Za-z]'|awk '{print $1}'|sed 's/:$//'`) # an array of interface names configured on this machine
numinterfaces=${#interface_names[@]}
declare -A v4ip # will be a hash with ipv4 addresses, keyed using interface name
declare -A v4name # will be a hash with ipv4 hostnames, keyed using interface name
declare -A ifspeeds # will be a hash with interface speeds, keyed using interface name

########
# MAIN #
########
# iterate over the interfaces array, gathering data into 
for interface in ${interface_names[@]}; do
# extract the assigned ip address(es) using ifconfig and store that in the ips hash
  v4ip[$interface]=`ip a s $interface|grep "inet "|awk '{print $2}'|sed 's,/.*,,'`
  v4name[$interface]=$(getent hosts ${v4ip[$interface]}|sed -e 's/.*  *//')
  ifspeeds[$interface]=$(ethtool $interface | grep Speed: | awk '{print $2}')
done

# display the gathered interface data in interface name order
for interface in `echo ${interface_names[@]}|sort`; do
  cat <<EOF
$interface @ ${ifspeeds[$interface]}
  ${v4ip[$interface]} ${v4name[$interface]}
  
EOF
done
# gather and display the rest of the report
# Find IP address of default gateway
v4gwip=$(route -n|grep '^0.0.0.0'|awk '{print $2}')
v4gwname=$(getent hosts $v4gwip|sed -e 's/.*  *//')

# Get info about our internet address
extip=$(curl -s icanhazip.com)
extname=$(getent hosts $extip|sed -e 's/.*  *//')

#Produce the report
cat <<EOF
Default Route:
  $v4gwip $v4gwname
Internet Identity:
  $extip $extname
  
EOF
