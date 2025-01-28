#!/bin/bash
for intf in `ifconfig|sed -e 's/ .*//'|grep [[:alpha:]]|grep -v '^lo$'`; do
echo "$intf" ; echo "--------" ; ifconfig $intf|grep inet|sed -e 's/.*addr: //' -e 's/.*addr://' -e 's/ .*//'|grep [[:print:]] ; echo
done
extip=`curl -s icanhazip.com`
gw=`route -n|grep '^0.0.0.0'|awk '{print $2}'`
echo "External IP: $extip via $gw"
