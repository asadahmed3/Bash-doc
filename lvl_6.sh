#!/bin/bash

# Write a script that accepts a filename as an argument and prints the number of 
# lines in that file. If no filename is provided, display a message saying 
#'No file provided'.

read -p "Enter the filename: " filename

if [[ -z "$filename" ]]; then
    echo "No file provided."
    elif [[ -f "$filename" ]]; then
    line_count=$(wc -l < "$filename")
    echo "The file '$filename' has $line_count lines."
    else
    echo "The file '$filename' does not exist."
fi

# Key Commands:

# - read: Reads input from the user.
# - wc -l: Counts the number of lines in a file.

