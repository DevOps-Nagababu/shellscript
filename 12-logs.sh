#!/bin/bash

USERID=(id -0)

if [ USERID -ne 0 ]; then
    echo "Please login to the root user"
    exit 1
fi

VALIDATE(){
    if [$1 -ne 0 ]; then

        echo "$2 .....FAILED"
        exit 1
    else
        echo "$2 .....SUCCESS"
}

dnf install nginx -y
VALIDATE $? "Installing Nginx"