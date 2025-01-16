#!/bin/bash
echo "All variables passed: $@"
echo "Number of  variables passed: $#"
echo "Script Name: $0"
echo "Present working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "Which user is runnig this script: $USER"
echo "Process id of current script: $$"
sleep 60 &
echo "Process id of last command in background: $!" 