#!/bin/bash

#I want  a command execute and take output into variable.

SCRIPT_START_TIME=$(date +%s)

echo "script start time is : $SCRIPT_START_TIME"
sleep 10 
SCRIPT_END_TIME=$(date +%s)
echo "script end time is : $SCRIPT_END_TIME"

DIFF_TIME=$(($SCRIPT_END_TIME-$SCRIPT_START_TIME))
echo "script end time is : $DIFF_TIME"