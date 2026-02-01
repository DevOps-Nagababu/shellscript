#!/bin/bash

USER_ID=$(id -u)
LOG_FOLDER="/var/log/shell_script"
LOG_FILE="$LOG_FOLDER/.$0.log"

 if [ $USER_ID -ne 0 ]; then
    echo "Please login to root user"
    exit 1
    
fi

VALIDATE(){
   if [ $1 -ne 0 ]; then
        echo "$2 Installation .....FAILD"
        exit 1
    else
        echo "$2 Installation......SUCCESS"
    fi
}

dnf install nginx -y
VALIDATE $? "installing nginx"