#!/bin/bash

# Stop the script if a command fails.
set -e

# Ask the user which directory should be monitored.
read -r -p "Enter the directory path to monitor: " directory

# Confirm that the fswatch monitoring tool is installed.
if ! command -v fswatch &> /dev/null; then
    echo "Error: fswatch is not installed."
    exit 1
fi

# Stop if the entered path is not a valid directory.
if [ ! -d "$directory" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

log_file="/tmp/directory_changes.log"

# Create the log file if it does not already exist.
touch "$log_file"

echo "Monitoring: $directory"
echo "Log file: $log_file"
echo "Press Control + C to stop."

# Monitor the directory recursively and separate each path from its event flags.
# %p represents the file path, while %f represents events such as Created or Removed.
fswatch -r --format="%p|%f" "$directory" |
while IFS="|" read -r file_path events; do
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    # Convert fswatch event flags into clear action names.
    # '$events' can contain multiple flags, Removed, Created, Updated..
    if [[ "$events" =~ Removed ]]; then
        action="DELETED"
    elif [[ "$events" =~ Created ]]; then
        action="CREATED"
    elif [[ "$events" =~ Updated ]]; then
        action="MODIFIED"
    else
        # Ignore events that are unrelated to the mission.
        continue
    fi

    message="[$timestamp] $action: $file_path"

    # Display the event and append it to the log file.
    echo "$message"
    echo "$message" >> "$log_file"
done

