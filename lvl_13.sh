#!/bin/bash
set -e
# Create a script that backs up a directory to a specified location and keeps only the last 5 backups.
# The key is to use a timestamped folder name for each backup and then prune the oldest backups if the total exceeds 5.
# In other words, use an array to keep track of the backup directories and remove the oldest ones when necessary.

backup() {

    read -p "Enter a directory you wish to be backed up: " backup

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
    # Populate the array line-by-line (works in Bash 3.2+)
    backups=()
    while IFS= read -r line; do
        backups+=("$line")
    done < <(find "$backup_location" -mindepth 1 -maxdepth 1 -type d -name "backup_*" | sort)

    # Prune oldest backups if total exceeds 5
    while [ "${#backups[@]}" -gt 5 ]; do
        oldest_backup="${backups[0]}"
        echo "Removing oldest backup: $oldest_backup..."
        rm -rf "$oldest_backup"
        printf "%s has been successfully removed.\n\n" "$oldest_backup"
        
        # Shift array to target next oldest item
        backups=("${backups[@]:1}")
    done
    
}
backup
