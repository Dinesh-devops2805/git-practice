#!/bin/bash

# algorithm 
# 1. Directory  -- mkdir devops 
# 2. multiple files linux.txt and shell-script.txt in it
# 3. find and replace the specific string

#You need to find and replace a specific string in multiple text files in a directory in shell script
#You can use the following script to achieve this:

DIR=$1    # 
STRING=$2   # arguement
NEW_STRING=$3
FILES=($(find "$DIR" -type f -name "*.txt"))
for file in "${FILES[@]}"
do
sed -i "s/$STRING/$NEW_STRING/g" "$file"
done





