#!/bin/bash

ID=$(id -u)

G="\e[32m"
Y="\e[33m"
N="\e[0m"
R="\e[31m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started excuting $TIMESTAMP" &>> $LOGFILE

VALIDATE(){


    if [ $1 -ne 0 ]
    then
        echo -e "$2 ...$R failed $N"
        exit 1
    else
        echo -e " $2 ...$G success $N"
     fi 
}

if [ $ID -ne 0 ]
then 
    echo -e "$R ERROR:: please run this script with root access $N"
    exit 1 # you can give other than 0
else
    echo "you are root user"
fi
# echo "All arguments that passed: $@"
# git mysql postfix net tools
# package=git for first time

for package in $@
do  
     yum list installed $package &>> $LOGFILE #check installed or not
     if [ $? -ne 0 ] #if not installed
     then
          yum install $package -y &>> $LOGFILE #install the package
          VALIDATE $? "Installing of $package" #validate
     else
           echo -e "$package is already installed ...$Y SKIPPING $N"
     fi
done              


    
   