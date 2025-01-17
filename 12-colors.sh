#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
USERID=$(id -u)
VALIDATE(){
    if [$1 -ne 0]
    then 
        echo -e "$2... $R Failure"
        exit 1
    else 
        echo -e "$2... $G success"
    fi
}
if [ $USERID -ne 0 ]
then
    echo -e $R "ERROR: YOU NEED TO LOGIN WITH SUDO"
    exit 1
fi
dnf list installed mysql
if [$? -ne 0]
then    
    dnf install mysql -y
    VALIDATE $? "Installing mysql"
else 
    echo -e $Y "Alreay Installed myql"
fi
dnf list installed git -y
if [$? -ne 0]
then 
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo -e $Y "Git installed already "
fi 
