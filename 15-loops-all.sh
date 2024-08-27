#!/bin/bash

USERID=$(id -u)
#echo "user ID is: $USERID"
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then    
        echo "Please run this script with root privileges"
        exit 1
    fi 
}
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is $R failed $N"
        exit 1 
    else 
        echo -e "$2 is $G success $N"
    fi
}

CHECK_ROOT

# usage - sh 15-loops-all.sh git mysql postfix nginx
for package in $@  # $@ refers to all arguments passed to it
do 
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo " $package is not instaleld, going to install it now.."
        dnf install $package -y 
        VALIDATE $? "Installing $package"
    else 
        echo " $package is already installed.. nothing to do"
    fi
done 