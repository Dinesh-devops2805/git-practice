#!/bin/bash

FRUITS=("APPLE","MANGO","STRAWBERRY")

echo "First fruit name is: ${FRUITS[0]}"
echo "Second fruit name is: ${FRUITS[1]}"
echo "Third fruit name is: ${FRUITS[2]}"

echo "All fruits names: ${FRUITS[@]}" # here '@' symbol indicates all the iteams in a list 
echo "All fruits names: ${FRUITS[*]}" # here '*' symbol indicates all the it


