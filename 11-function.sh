#!bin/bash

USERID=$(id -u)


    if [ $USERID -ne 0 ]; then
        echo "Please login with root user and install the softwares"
        exit 1
    fi

VALIDATE(){
if [ $1 -ne 0 ]; then
    echo "$2 .... FAILURE"
    else
    echo "$2 .... SUCCESS"
fi
}

dnf install nginx -y
VALIDATE $? installing nginx