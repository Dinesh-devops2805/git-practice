#!/bin/bash

# Set the directory, old string, and new string from command-line arguments
DIR=$1
OLD_STRING=$2
NEW_STRING=$3

# Print usage message if no arguments are provided
if [ -z "$DIR" ] || [ -z "$OLD_STRING" ] || [ -z "$NEW_STRING" ]
then
  echo "Usage: $0 <directory> <old_string> <new_string>"
  exit 1
fi

# Find all .txt files in the specified directory and its subdirectories
FILES=($(find "$DIR" -type f -name "*.txt"))

# Loop through each file and replace the old string with the new string
for file in "${FILES[@]}"; do
  sed -i "s/$OLD_STRING/$NEW_STRING/g" "$file"
  echo "Replaced '$OLD_STRING' with '$NEW_STRING' in $file"
done




