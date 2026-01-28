#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
echo  "Please run this script with root user access"
exit 1
fi
echo "installing Nginx"
dnf install nginx -y

if [ $? -ne 0]; then
echo " installing nginx ------ FAILD"
exit 1
else
echo "installing nginx --------SUCESS"
fi