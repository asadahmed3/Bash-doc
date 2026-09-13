#!/bin/bash
set -e

# Write a script that sorts all .txt files in a directory by their size, 
# from smallest to largest, and displays the sorted list.

read -p "Enter the directory path: " dir_path

if [ -d "$dir_path" ]; then
    echo "Sorting .txt files in $dir_path by size (smallest to largest):"
    find "$dir_path" -maxdepth 1 -type f -name "*.txt" -exec ls -lhS {} + | awk '{print $5, $9}' | sort -n
else
    echo "The specified path is not a directory."
fi

# Key points:
# 1. The script prompts the user to enter a directory path.
# 2. It checks if the provided path is a valid directory.
# 3. It uses the `find` command to locate all .txt files in the specified directory (without descending into subdirectories).
# 4. The `ls -lhS` command lists the files with their sizes in human-readable format, sorted by size.
# 5. The `awk` command extracts the size and filename from the output.
# 6. Finally, the `sort -n` command sorts the list numerically by file size, displaying the sorted list