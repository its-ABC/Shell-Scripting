
#!/bin/bash


# updating the package list
update_package_list() {
    echo "#####"
    echo "####"
    echo "###"
    echo "#"
    echo "Updating package list..."
    sudo apt update
    exit 0

}

# upgrade installed packages
upgrade_packages() {
    echo "#####"
    echo "####"
    echo "###"
    echo "#"

    echo "Upgrading packages..."
    sudo apt upgrade -y
    exit 0
}

# clean up unnecessary packages
clean_up() {
	echo "#####"
    echo "####"
    echo "###"
    echo "#"

    echo "Cleaning up unnecessary packages..."
    sudo apt autoremove -y
    sudo apt autoclean
    exit 0
}

# display disk usage
disk_usage() {
    echo "#####"
    echo "####"
    echo "###"
    echo "#"

    echo "Displaying disk usage..."
    df -h
    exit 0
}

# list available updates
list_updates() {
    echo "#####"
    echo "####"
    echo "###"
    echo "#"
	echo "Listing available updates..."
    apt list --upgradable
    exit 0
}
# tasks all together get executed
execute_all() { 

    # i just added this to find the time taken for it to complete this process. (^_^)
    # starting the count of seconds to complete the task
     

     echo "Executing all tasks..."
     echo "#####"
     echo "####"
     echo "###"
     echo "#"

     echo "updating..."
     echo " - "

     sudo apt update
     echo "#####"
     echo "####"
     echo "###"
     echo "#"
   
     echo "upgrading"
     echo " - "
     sudo apt upgrade -y
     echo "#####"
     echo "####"
     echo "###"
     echo "#"
     
     echo "cleaning & removing files that not needed"
     echo " - "
     sudo apt autoremove -y
     sudo apt autoclean
     echo "#####"
     echo "####"
     echo "###"
     echo "#"
     
     echo "Displaying disk usage"
     echo " - "
     df -h
     echo "#####"
     echo "####"
     echo "###"
     echo "#"
     
     echo "Memory"
     echo " - "
     free -h
     echo "#####"
     echo "####"
     echo "###"
     echo "#"

     echo "Listing upgradable...."
     echo " - "
     sudo apt list --upgradable
     echo " "
     
     echo "(^_^)"

    
     exit 0
}

memory() {
	echo "Memory"
	free -h
        exit 0
}	

# show the script menu
show_menu() {
    echo "System Maintenance Script"
    echo "0. Execute all tasks"
    echo "1. Update package list"
    echo "2. Upgrade packages"
    echo "3. Clean up unnecessary packages"
    echo "4. Display disk usage"
    echo "5. Memory Available"
    echo "6. List available updates"
    echo "7. Exit"
}

# select the option u need
while true; do
    show_menu
    read -p "Please choose an option [0-7]: " option
    case $option in
        0) execute_all ;;
        1) update_package_list ;;
        2) upgrade_packages ;;
        3) clean_up ;;
        4) disk_usage ;;
	    5) memory;;
        6) list_updates ;;
        7) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please choose between 0 and 7." ;;
    esac
    echo ""  
done

