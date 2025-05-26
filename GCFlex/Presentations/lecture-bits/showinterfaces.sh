#!/bin/bash
# this script enumerates our 2 interfaces and
#   displays their configured IPV4 addresses

interfaces=(`ifconfig |grep '^[A-Za-z]'|awk '{print $1}'`)
echo "We have ${#interfaces[@]} interfaces"
ip[0]=`ifconfig ${interfaces[0]}|grep "inet"|sed -e 's/.*addr://' -e 's/ .*//'`
ip[1]=`ifconfig ${interfaces[1]}|grep "inet"|sed -e 's/.*addr://' -e 's/ .*//'`
echo "${interfaces[0]} has address ${ip[0]}"
echo "${interfaces[1]} has address ${ip[1]}"
gwip=`route -n|grep '^0.0.0.0'|awk '{print $2}'`
echo "Our default route is through $gwip"
