#!/bin/bash 

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}   # If $3 is empty, default is 14 days 
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)


R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

USAGE(){
    echo -e "$R Usage:: $N sh 19-backup.sh <source_dir> <dest_dir> <days(optional)>"
}

# check the source and destination are provided

if [ $# -lt 2 ]
then 
    USAGE
fi 

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R Source directory $SOURCE_DIR does not exist.. please check $N"
fi 

if [ ! -d $DEST_DIR ]
then
    echo -e "$R Source directory $DEST_DIR does not exist.. please check $N"
fi 

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime $DAYS)

echo "Files: $FILES"

if [ ! -z $FILES ]    # true if FILES is empty, ! makes it expression false
then
    echo "Files are found"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime $DAYS | zip "$ZIP_FILE" -@

    #check if zip file is successfully craeted or not
    if [ -f $ZIP_FILE ]
    then
        echo -e "$G Zip file created successfully older than $DAYS"
    
        # remopve the files after zipping
        while IFS= read -r file    #IFS, internal field seperator, empty it will ignore while space. -r is for not to ignore special characters like /
        do 
            echo "Deleting files: $file"
            m -rf $file
        done <<< $FILES 
    
    else
        echo "Zipping the files is failed"
        exit 1 
    fi
else
    echo "No files found older than $DAYS"
fi