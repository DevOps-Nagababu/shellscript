#!/bin/bash
echo "All arg passed in the script $@"
echo "Number of Variables passed in the script $#"
echo "Script name : $0"
echo "Present working directory $PWD"
echo " who is running in the script $USER"
echo "What is the working directory $HOME"
echo "What is the process ID $$"
sleep 100 &
echo "What is the background running PID $!"
echo "What is the exit code of previous command : $?"
