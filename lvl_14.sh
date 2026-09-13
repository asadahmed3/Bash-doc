#!/bin/bash

# Level 14: User-Friendly Menu Script
# Create an interactive script that presents a menu with options for different system tasks 
# (e.g., check disk space, show system uptime, list users), and executes the chosen task.

echo "Choose an option:
1) Check disk space
2) Show system uptime
3) List users"
printf "\n"

read -p "Enter your choice (1-3): " choice

if [[ $choice -eq 1 ]]; then
    printf "\n"
    read -p "Enter the directory to check disk space: " dir
    printf "\n"
    echo "Checking disk space of $dir..."
    printf "\n"
    echo "Disk space of $dir: " $(du -sh "$dir")

    # -----------------------------------------------------------------------------------------------
    elif [[ $choice -eq 2 ]]; then
    printf "\n"
    echo "Showing system uptime..."
    uptime

    # -----------------------------------------------------------------------------------------------
    elif [[ $choice -eq 3 ]]; then
    printf "\n"
    echo "Listing users..."
    compgen -u

    else 
    printf "\n"
    echo "Invalid choice. Please select a valid option (1-3)."
fi

