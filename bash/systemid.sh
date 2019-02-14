#!/bin/bash
#
# this script displays some host identification information for a simple Linux machine
# this version is specifically allowed to hardcode an interface name even though it is bad practice
#
# Sample output:
#   Hostname      : zubu
#   LAN Address   : 192.168.2.2
#   LAN Name      : net2-linux
#   External IP   : 1.2.3.4
#   External Name : some.name.from.our.isp

# the LAN info uses a hardcoded interface name of "ens33"
#    - change eno1 to whatever interface you  have and want to gather info about
# Improve this script by including the default router address and name
# Improve this script by including the network name

# we use the hostname command to get our system name
# the LAN name is looked up using the LAN address in case it is different from the system name
# finding external information relies on curl being installed and relies on live internet connection
# grep is used to filter ip command output so we don't have extra junk in our output
# stream editing with sed and awk are used to extract only the data we want displayed


myhostname=$(hostname)
myLanip=$(ip a s ens33|grep 'inet '|awk '{print $2}'|sed 's,/.*,,')
myLanname=$(ip link | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2;getline}'get)

echo "
Hostname      : $myhostname
LAN Address   : $myLanip
LAN Name      : $myLanname
External IP   : $(curl -s icanhazip.com)
External Name : $(getent hosts `curl -s icanhazip.com` | awk '{print $2}')
Router IP     : $(ip route list default|awk '{print$3}')
Router Name   : $(ip route list default|awk '{print $1}')
"

