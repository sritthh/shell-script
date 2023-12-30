#!bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo "$R ERROR:: please run this script with root access $N"
    exit 1 # you can give other than 0
else
    echo "you are root user"
fi

echo "All arguements that passed: $@"