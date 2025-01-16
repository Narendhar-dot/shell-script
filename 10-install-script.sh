#!/bin/bash
USERID=$(id -u)
if [$USERID -ne 0]
then 
    echo "ERROR: YOU DO NOT HAVE THE PERMISSION TO INSTALL MYSQL. YOU NEED SUDO ACCESS"
    exit 1
fi
dnf list installed mysql
if [$? -ne 0]
    then
        dnf install mysql -y
    if[$? -ne 0]
    then
        echo "Installation of mysql...FAILURE"
    else
        echo "Installation of mysql...SUCCESS"
else
    echo "MYSQL INSTALLED"
fi

