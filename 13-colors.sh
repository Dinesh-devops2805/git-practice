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
        echo "$2 is $R failed $N"
        exit 1 
    else 
        echo "$2 is $G success $N"
    fi
}

CHECK_ROOT

dnf list installed git

if [ $? -ne 0 ]
then 
    echo "Git is not installed. Installing it now..."
    dnf install git -y 
    VALIDATE $? "Installing Git"
else
    echo "Git is already installed"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "MYSQL is not installed. please install it now"
    dnf install mysql -y 
    VALIDATE $? "Installing MySQL"
else 
    echo "MYSQL is already installed"
fi
