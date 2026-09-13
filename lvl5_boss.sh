#!/bin/bash

# This script is designed to combine what I have learned in the previous levels 
# and apply it to a more complex scenario. 
# Looping, error handling, conditionals, etc.

set -e

mkdir Battlefield

cd Battlefield
touch knight.txt
touch sorcerer.txt
touch rogue.txt
mkdir Archive

if [[ -f "knight.txt" ]]; then
    echo "Knight is recorded in Valhalla!"
    echo "Moving knight.txt to Archive directory."
    mv knight.txt Archive
fi


