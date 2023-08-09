#!/bin/bash

# Prompt the user to enter the directory path
read -p "Enter the full directory path: " directory

# Prompt the user to enter the file extension
read -p "Enter the file extension (including the dot): " extension

# Loop through all files in the directory
for file in "$directory"/*"$extension"
do
    if [ -f "$file" ]; then
        echo "$file"
        # Add your desired actions for each file here
    fi
done
