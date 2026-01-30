#!/bin/bash

USERID=(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"


if [ $USERID -ne 0 ]; then
    echo "Please login to the root user" | tee -a $LOGS_FILE
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then

        echo "$2 .....FAILED" | tee -a $LOGS_FILE
        exit 1
    else
        echo "$2 .....SUCCESS" | tee -a $LOGS_FILE
    fi
}

# dnf install nginx -y &>> $LOGS_FILE
# VALIDATE $? "Installing $2"


#Check if already installed or not if not installed installe it if already instted skip the installataion
for packages in $@ # 12-logs.sh nodejs python3 mysql
do  
    dnf install $packages -y &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        dnf install $packages -y &>> $LOGS_FILE
        VALIDATE $? "installing $packages"
     else
        echo "$package alrady installed , skipping
    fi
done 