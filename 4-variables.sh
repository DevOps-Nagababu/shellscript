#!/bin/bash

# User promt the during run time and values enter from keyboard

echo "Please enter the user name: "
read USER_NAME
echo "Hello $USER_NAME"
echo "Please enter the password :"
read -s PASS # -s is hide the value entered from keyboard
echo " Display password entered from keyboard : $PASS "  