#!/bin/bash

# Write a script that reads a configuration file in the format KEY=VALUE and prints each key-value pair.

read_config_file() {

    read -p "Enter the path to the configuration file: " config_file
    printf "\n"

    if [ ! -f "$config_file" ]; then
        echo "Error: The specified configuration file does not exist."
        exit 1
    fi

    echo "Reading configuration from $config_file:"
    printf "\n"

    # Ensures that the script splits the lines correctly and doesn't break on spaces or special characters in the values
    while IFS='=' read -r key value; do
        # Skip empty lines and comments
        if [[ -n "$key" && ! "$key" =~ ^# ]]; then
            echo "Key: $key = Value: $value"
        fi
    done < "$config_file"

}
read_config_file

