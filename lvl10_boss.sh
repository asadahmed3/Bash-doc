#!/bin/bash

set -e


# Write a script that:

# 1. Creates a directory called Arena_Boss.
# 2. Creates 5 text files inside the directory, named file1.txt to file5.txt.
# 3. Generates a random number of lines (between 10 and 20) in each file.
# 4. Sorts these files by their size and displays the list.
# 5. Checks if any of the files contain the word 'Victory', and if found, moves the file to a directory called Victory_Archive.

# WARNING: Before you start, delete any existing Arena_Boss and Victory_Archive directories to avoid conflicts.
# And move the file to the home directory for testing.

mkdir -p Arena_Boss

Random_lines() {
    for i in {1..5}; do
        touch "Arena_Boss/file$i.txt"
        echo "Created Arena_Boss/file$i.txt"
    done

    for file in Arena_Boss/*.txt; do
        lines=$((RANDOM % 11 + 10))

    for ((j=1; j<=lines; j++)); do
        echo "This is line $j in $file"
    done > "$file"

    if (( RANDOM % 2 )); then 
        echo "Victory" >> "$file"
    fi

    done
    printf "\n"
    echo "----------------------------------------------------"
    printf "\n"
}
Random_lines

Victory_Check() {

    if [ -d "Arena_Boss" ]; then
        echo "Sorting .txt files in Arena_Boss by size (smallest to largest):"
        printf "\n"
        find "Arena_Boss" -maxdepth 1 -type f -name "*.txt" \
        -exec ls -lhS {} + | awk '{print $5, $9}' | sort -h
        
        printf "\n"
        echo "Checking for files containing the word 'Victory':"
        printf "\n"

        ls Arena_Boss/*.txt | while read file; do
            if grep -q "Victory" "$file"; then
                mkdir -p Victory_Archive
                mv "$file" Victory_Archive/
                printf "Successfully moved $file to Victory_Archive.\n"
            fi
        done
    else
        printf "The specified path is not a directory.\n"
    fi
} 
Victory_Check



