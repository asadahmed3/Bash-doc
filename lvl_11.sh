#!/bin/bash

# Create a script that checks the disk space usage of a specified directory 
# and sends an alert if the usage exceeds a given threshold.

Check_disk_usage() {

    read -p "Enter the directory path to check disk usage: " dir_path

    if [ ! -d "$dir_path" ]; then
        echo "Error: The specified directory does not exist."
        exit 1
    fi

    read -p "Enter the disk usage threshold percentage (e.g., 80 for 80%): " threshold

    if [ "$threshold" -lt 0 ] || [ "$threshold" -gt 100 ]; then
        echo "Error: Threshold must be between 0 and 100."
        exit 1
    fi


    # We need to use piping to execute three important parts
    # 1 - Extract the disk usage
    # 2 - Print the first column of the output (e.g 52K )
    # 3 - Remove unnessacary characters 'K' to keep it as an integer for operations
    usage=$(du -sh "$dir_path" | awk '{print $1}' | tr -d 'K')

    # Compare the usage with the threshold
    if [ "$usage" -gt "$threshold" ]; then
        printf "\n"
        echo "Alert: Disk usage for $dir_path has exceeded the threshold of $threshold%."
        echo "The total disk amount is: $usage%."
    fi

} 
Check_disk_usage


