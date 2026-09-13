#!/bin/bash
set -e
# Create a script that searches for a specific word or phrase across all .log files in a directory and 
# outputs the names of the files that contain the word or phrase.

read -p "Enter the directory path: " dir_path
read -p "Enter the word or phrase to search for: " search_term

if [[ ! -d "$dir_path" ]]; then
    echo "The specified directory does not exist."
    exit 1
fi

find "$dir_path" -type f -name "*.log" -exec grep -l "$search_term" {} \; > search_results.txt

echo "Search results saved to search_results.txt"

# Key points:
# 1. The script prompts the user for a directory path and a search term.
# 2. It checks if the specified directory exists.
# 3. It uses the `find` command to locate all .log files in the specified directory and its subdirectories.
# 4. It uses `grep` to search for the specified term in each .log file and outputs the names of the files that contain the term.
# 5. The results are saved to a file named search_results.txt in the current working directory.
# 6. The asterisk (*) is a wildcard character that means "any characters" or "everything."

