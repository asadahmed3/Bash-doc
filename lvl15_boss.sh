#!/bin/bash
set -e
# Combine the skills you've gained! Write a script that:

# 1. Presents a menu to the user with the following options:

# - Check disk space
# - Show system uptime
# - Backup the Arena directory and keep the last 3 backups
# - Parse a configuration file settings.conf and display the values

# 2. Execute the chosen task.

echo "Choose an option:
1) Check disk space
2) Show system uptime
3) Backup Arena directory
4) Parse settings.conf"
printf "\n"

read -p "Enter your choice (1-4): " choice


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
    
    # Backup Arena directory and keep last 3 backups
    backup() {
        read -p "Enter the arena directory to back up: " backup

    if [ ! -d "$backup" ]; then
        printf "\nThe directory entered does not exist.\nTry again.\n"
        exit 1
    fi

    printf "\n"
    read -p "Enter the backup location: " backup_location
    mkdir -p "$backup_location"

    # Define a timestamped target directory inside backup_location
    timestamp=$(date +%Y%m%d_%H%M%S)
    target_dir="$backup_location/backup_$timestamp"

    printf "\n"
    echo "Backing up $backup to $target_dir..."
    cp -r "$backup" "$target_dir"
    echo "Backup completed successfully."
    printf "\n"

    
    # Get array of backups sorted chronologically by folder name (oldest first)
    backups=()
    while IFS= read -r line; do
        backups+=("$line")
    done < <(find "$backup_location" -mindepth 1 -maxdepth 1 -type d -name "backup_*" | sort)

    # Prune oldest backups if total exceeds 5
    while [ "${#backups[@]}" -gt 3 ]; do
        oldest_backup="${backups[0]}"
        echo "Removing oldest backup: $oldest_backup..."
        rm -rf "$oldest_backup"
        printf "%s has been successfully removed.\n\n" "$oldest_backup"
        
        # Shift array to target next oldest item
        backups=("${backups[@]:1}")
    done
    
    }
    backup

    # -----------------------------------------------------------------------------------------------
    elif [[ $choice -eq 4 ]]; then
    printf "\n"
    touch settings.conf
    CONFIG_FILE="settings.conf"
    echo "Parsing settings.conf..." >> "$CONFIG_FILE"
    # Parse settings.conf and display values
    if [ -f "$CONFIG_FILE" ]; then
        printf "\n"
        echo "Parsing below: "
        printf "\n"

        # Specify the delimiter as '.' and read key-value pairs
        while IFS='.' read -r key value; do
            echo "Key: $key, Value: $value"
        done < "$CONFIG_FILE"
    
    else
        echo "settings.conf file not found."
    fi

    else 
    printf "\n"
    echo "Invalid choice. Please select a valid option (1-4)."
    
    
fi