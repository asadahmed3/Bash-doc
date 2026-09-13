#!/bin/bash

condition() {

read -p "Enter the hero file name: " hero

if [ -f "$hero" ]; then

	echo "Hero found!"
	else 
	echo "Hero missing!"
fi
}
condition
