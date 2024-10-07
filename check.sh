#!/bin/bash

# Function to check connectivity to a specific website
check_connectivity() {
    local website=$1   # First argument is the website's URL
    local name=$2      # Second argument is the name for the website
    
    # here we ping the sites with 2 packets (-c 2). Suppress output (&> /dev/null)
    ping -c 2 $website &> /dev/null
    
    # now check the exit status of ping command
    if [ $? -eq 0 ]; then
        # If the ping succeed, print the message below
        echo "$name: SUCCESSFUL"
    else
        # If the ping command fails, print the message
        echo "$name: FAILED"
    fi
}

# Associative array: set url as keys & names as values
declare -A websites
websites=(["www.google.com"]="Google  " ["www.youtube.com"]="YouTube" ["www.github.com"]="GitHub " ["www.aws.amazon.com"]="AWS" )

# Loop through the associative array and check connectivity
for site in "${!websites[@]}"
do
    check_connectivity $site ${websites[$site]}
done


wifi=$(nmcli device status | grep wifi | grep connected)
ethernet=$(nmcli device status | grep ethernet | grep connected)

if [[ -n "$wifi" ]]; then
    echo "|"
    echo "Connected via Wi-Fi."
    echo "|"
elif [[ -n "$ethernet" ]]; then 
    echo "|"
    echo "Connected via Ethernet."
    echo "|"
else
    echo "|"
    echo "Not connected via Wi-Fi or Ethernet."
    echo "|"
fi


