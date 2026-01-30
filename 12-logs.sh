#!/bin/bash

USERID=(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"


if [ $USERID -ne 0 ]; then
    echo "Please login to the root user"
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then

        echo "$2 .....FAILED"
        exit 1
    else
        echo "$2 .....SUCCESS"
    fi
}

dnf installfds nginx -y &>> $LOGS_FILE
VALIDATE $? "Installing Nginx"