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
    if [$? -ne 0]
    then 
        echo "Installation of mysql---FAILED"
    else
        echo "Installation of mysql---succeded"
    fi
else 
    echo "MYSQL Installed already!!!!"
fi
dnf list installed git
if [ $? -ne 0 ]
then   
    dnf install git -y
    if [ $? -ne 0 ]
    then 
        echo "Installation of git...Failure"
    else
        echo "Installation og git...success"
    fi
else 
    echo "Git Installed already!!!!"
fi

