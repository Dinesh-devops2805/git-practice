#!/bin/bash 

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}   # If $3 is empty, default is 14 days 


R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

USAGE(){
    echo -e "$R Usage:: $N sh 19-backup.sh <source_dir> <dest_dir> <days(optional)>"
}

# check the source and destination are provided

if [$# -lt 2 ]
then 
    USAGE
fi