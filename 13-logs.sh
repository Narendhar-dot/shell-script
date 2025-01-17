#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shell-script-logs"
LOG_FILE=$(echo $0 | cut -d '.' -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script-logs"
VALIDATE(){
    if [$1 -ne 0]
    then 
        echo -e "$2... $R Failure"
        exit 1
    else 
        echo -e "$2... $G success"
    fi
}
echo "script started executing at :$TIMESTAMP" &>>$LOG_FILE_NAME
if [ $USERID -ne 0 ]
then
    echo -e $R "ERROR: YOU NEED TO LOGIN WITH SUDO"
    exit 1
fi
dnf list installed mysql &>>$LOG_FILE_NAME
if [$? -ne 0]
then    
    dnf install mysql -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing mysql"
else 
    echo -e $Y "Alreay Installed myql $N"
fi
dnf list installed git -y &>>$LOG_FILE_NAME
if [$? -ne 0]
then 
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing Git"
else
    echo -e $Y "Git installed already $N"
fi 
