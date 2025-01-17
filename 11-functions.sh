#!/bin/bash
USERID=$(id -u)
VALIDATE(){
    if [$1 -ne 0]
    then 
        echo "$2...Failure"
        exit 1
    else 
        echo "$2...success"
    fi
}
if [ $USERID -ne 0 ]
then
    echo "ERROR: YOU NEED TO LOGIN WITH SUDO"
    exit 1
fi
dnf list installed mysql
if [$? -ne 0]
then    
    dnf install mysql -y
    VALIDATE $? "Installing mysql"
else 
    echo "Installed myql"
fi
dnf list installed git -y
if [$? -ne 0]
then 
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "Git installed already "
fi 
