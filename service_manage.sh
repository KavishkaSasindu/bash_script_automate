#!/bin/bash

######################################
# Author : Kavishka Sasindu
# Date : 2025-07-06
# Purpose : service maintain
# Version : v1
#####################################

# debugging and error handling
# set -x
set -e
set -o pipefail

# Example to run script
# ./service_maintain.sh <servicea_name>

# Get service name from user
SERVICE=$1

# check argument is not empty
if [[ -z "$SERVICE" ]]
then
        echo "Please enter service name!!!!!"
        exit 1
fi

# check service is installed
if ! sudo systemctl status "$SERVICE" &> /dev/null
then
        echo "Service is not installed !!!"
        exit 1
else
        # check service is active
        echo "Checking service is active....."

        # command to check service is active
        SERVICE_ACTIVE=$(sudo systemctl is-active $SERVICE)

        if [[ $SERVICE_ACTIVE == "active" ]]
        then
                echo "Service is already active"
        else
                # activate service
                echo "Service is not active! Activating....."

                # command to activate service
                sudo systemctl start $SERVICE
        fi

        # check service is enabled
        echo "Checking service is enabled"

        # command to check service is enabled
        SERVICE_ENABLED=$(sudo systemctl is-enabled $SERVICE)

        if [[ $SERVICE_ENABLED == "enabled" ]]
        then
                echo "Service already enabled!!!!"

        else
                # enabled the service
                echo "Enabling service........"

                # command to enable
                sudo systemctl enable $SERVICE

        fi
fi
