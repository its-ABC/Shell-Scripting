#!/bin/bash


# echo "Checking internet connection..."
if ping -c 1 8.8.8.8 &> /dev/null
then 
    
    echo "***"
    echo "****"
    echo "*****"
    echo "Connected to internet"
    echo "*****"
    echo "****"
    echo "***"
    
else
    echo "***"
    echo "****"
    echo "*****"
    echo "No Internet"
    echo "*****"
    echo "****"
    echo "***"
fi



wifi=$(nmcli device status | grep wifi | grep connected)
ethernet=$(nmcli device status | grep ethernet | grep connected)

if [[ -n "$wifi" ]]; then
    echo "Connected via Wi-Fi."
elif [[ -n "$ethernet" ]]; then
    echo "Connected via Ethernet."
else
    echo "Not connected via Wi-Fi or Ethernet."
fi


echo "Checking internet speed..."
speedtest-cli --simple


echo "IP Address: "
hostname -I


echo "Default Gateway: "
ip route | grep default | awk '{print $3}'


echo "DNS Servers: "
nmcli dev show | grep 'IP4.DNS'


echo "Network Interface Information: "
ifconfig


