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

VALIDATE(){
    if [$1 -ne 0]
    then 
        echo -e "$2... $R Failure"
        exit 1
    else 
        echo -e "$2... $G success"
    fi
}
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
        echo -e $R "ERROR:: You must have sudo access to execute the script" $N
        exit 1
    fi
}

echo "script started executing at :$TIMESTAMP" &>>$LOG_FILE_NAME
if [ $USERID -ne 0 ]
then
    echo -e $R "ERROR: YOU NEED TO LOGIN WITH SUDO"
    exit 1
fi
for i in $@
do
    dnf list installed $i &>>$LOG_FILE_NAME
    if [ $? -ne 0 ]
    then 
        dnf install $i &>>$LOG_FILE_NAME
        VALIDATE $? "Installing $i"
    else
        echo -e "$i Installed already $Y...Installed $N"
    fi

done
