
#!/bin/bash

# Function to display logs using the 'last' command
show_logs() {
    echo "Displaying user login/logout logs:"
    last
}

# Function to confirm that the logs are valid
confirm_logs() {
    while true; do
        read -p "Are you satisfied with the logs? (yes/no): " yn
        case $yn in
            [Yy]* ) echo "Logs confirmed."; break;;
            [Nn]* ) echo "Please check the logs again."; show_logs;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# Function to execute the next set of commands after logs are confirmed
execute_next_commands() {
    echo "Executing the next commands..."
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt autoremove -y
    sudo apt list --upgradable

    echo "Task completed!"
}

# Main script execution
show_logs            # Display logs using the 'last' command
confirm_logs         # Prompt user for confirmation
execute_next_commands # Execute the next commands only if logs are confirmed
