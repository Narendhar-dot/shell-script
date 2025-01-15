#!/bin/bash
USERID=$(id -u)
if [$USERID -ne 0]
then 
    echo "You must have sudo access to install MYSQL"
    exit 1 #other than 0
fi

dnf install mysql -y

if [$? -ne 0]
then 
    echo "Installing mysql....FAILURE"
    exit 1
else
    echo "Installing MYSQL...SUCCESSED"
fi

dnf install git -y

if [$? -ne 0]
then 
    echo "Installing git...Failed"
else
    echo "Installing git...successed"
fi
