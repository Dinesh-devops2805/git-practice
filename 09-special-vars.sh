#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number of variables passed: $#"
echo "To know the script name: $0"
echo "To know the current working directory: $PWD"
echo "To know the home directory of current user: $HOME"
echo "Process instance ID of the script executing now: $$"
sleep 100 & 
echo "PID of last backgroun command: $!"

