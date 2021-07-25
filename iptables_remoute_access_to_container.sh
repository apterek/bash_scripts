#!/bin/bash
EXT_IP="10.1.1.221" # ip address VM interface eth0
INT_IP="172.17.0.1" # ip address interface docker0
EXT_IF="eth0" # interface name eth0
INT_IF="docker0" # interface name docker0
LAN_IP="172.20.0.10"   # ip docker container with
SRV_PORT="5601" # port for web

echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward # enabling traffic forwarding at the kernel level
iptables -t nat -A PREROUTING --dst $EXT_IP -p tcp --dport $SRV_PORT -j DNAT --to-destination $LAN_IP # change the external ip to the internal ip
iptables -t nat -A POSTROUTING --dst $LAN_IP -p tcp --dport $SRV_PORT -j SNAT --to-source $INT_IP # use that the response packet passes through interface docker0 necessarily
iptables -t nat -A OUTPUT --dst $EXT_IP -p tcp --dport $SRV_PORT -j DNAT --to-destination $LAN_IP # remove the loop on the gateway 
iptables -I FORWARD 1 -i $EXT_IF -o $INT_IF -d $LAN_IP -p tcp -m tcp --dport $SRV_PORT -j ACCEPT # permit forwarding rule 

# This script is active until the VM is rebooted, so that the settings are saved after the reboot, after executing the script, do the following command: sudo sysctl -w net.ipv4.ip_forward=1
