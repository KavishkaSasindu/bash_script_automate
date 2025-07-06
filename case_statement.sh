#!/bin/bash

###########################
# Author : ksdev
# Date : 2025-07-05
#
# Output : output using case statement
#
# Version : v1
###########################

set -e
set -o pipefail

# Choosing points
echo "a.Want to add two numbers: "
echo "b.Want to look for disk space: "
echo "c.check for number between 1 and 10: "

# Get user input
read -p "Enter your option: " CHOICE

# case statements
case $CHOICE in
        a)
                #get numbers from user
                read -p "Enter your two numbers (seperate by space): " -a NUMBERS

                #validate and add
                if [[ "${#NUMBERS[@]}" -ne 2 ]]
                then
                        echo "You must provode the exact 2 numbers"
                else
                        SUM=$((${NUMBERS[0]} + ${NUMBERS[1]}))
                        echo "Your sum is $SUM"
                fi
                ;;

        b)
                #command to display disk space
                sudo df -h
                ;;

        c)
                #check for number between 1 and 10
                read -p "Enter your number: " NUMBER

                #validate and check
                if [[ -z "$NUMBER" ]]
                then
                        echo "you must enter a number"
                elif [[ "$NUMBER" -gt 1 && "$NUMBER" -lt 10 ]]
                then
                        echo "Your number is with 1 and 10 range"
                else
                        echo "you are out of range"
                fi
                ;;
        *)
                echo "Please enter valid answer"
                ;;
esac