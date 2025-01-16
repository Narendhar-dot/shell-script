#!/bin/bash
USERID=$(id -u)
if [$USERID -ne 0]
then 
    echo "ERROR: YOU DO NOT HAVE THE PERMISSION TO INSTALL MYSQL. YOU NEED SUDO ACCESS"
    exit 1
fi
dnf list installed mysql


