#!/bin/bash

# Exit immediately if any command exits with a non-zero status
set -e

# ==============================================================================
# CONFIGURATION
# ==============================================================================
src_dir="/Users/laptop208/Arena"
dest_dir="/Users/laptop208/desktop/backup"

# NOTE: We omit the "*" here. Keeping just the suffix prevents pattern 
# expansion issues inside the loop construct.
ext_suffix="txt"


# ==============================================================================
# FILE COPIER LOGIC
# ==============================================================================

# Ensure the destination directory exists before copying to prevent errors
mkdir -p "$dest_dir"

# Use compgen -G to safely check if any *.txt files exist before looping.
# This prevents Bash from treating the wildcard as a literal text string if the folder is empty.
if ! compgen -G "$src_dir"/*."$ext_suffix" > /dev/null; then
    echo "No files with extension *.$ext_suffix found in $src_dir."
    exit 0
fi

# Loop through matching files. The wildcard must be UNQUOTED so the shell 
# expands it into a list of individual files.
for file in "$src_dir"/*."$ext_suffix"; do
    
    # Double-check it is a regular file (and not a directory matching the pattern)
    if [ -f "$file" ]; then
        cp "$file" "$dest_dir"
        echo "Copied: $(basename "$file") -> $dest_dir"
    fi
    
done

echo "Backup complete!"
