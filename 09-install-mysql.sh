#!bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo "ERROR:: please run this script with root access"
    exit 1 # you can give other than 0
else
    echo "you are root user"
fi

yum install mysql -y

if [ $? -ne 0 ]
then
  echo "ERROR:: installing MYSQL has failed"
  exit1
  else
      echo "installing MYSQL success"
 fi     

yum install git -y

if [ $? -ne 0 ]
then 
   echo "ERROR:: installing GIT has failed"
   exit
   else 
      echo "installing GIT success"
 fi     