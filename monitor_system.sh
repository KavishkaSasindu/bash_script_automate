#!/bin/bash

######################################
# Author : Kavishka Sasindu
# Date : 2025-07-06
# Output : usage of memory, CPU, disk
# Version : v1
#####################################

# debugging and error handling
# set -x
set -e
set -o pipefail

# Start Script =======
echo '==============================='
echo '---System Health Report--------'
echo '==============================='
echo ''


# create directory
DIRECTORY="/home/vagrant/output_log"

if [[ -d $DIRECTORY ]]
then
        echo ""
else
        sudo mkdir $DIRECTORY
fi

TIME=$(date)

# monitor free RAM space
RAM_FILE=$DIRECTORY/free_RAM_space.txt
{
        echo ""
        echo "$TIME"
        sudo free -hm | awk -F' ' '/^Mem:/ {print $2}'
} >> $RAM_FILE

# disk usage
DISK_FILE=$DIRECTORY/usage_disk_space.txt
{
        echo ""
        echo "$TIME"
        sudo df -h | grep -v 'tmpfs' | awk -F' ' '{print $1"  ",$4"  ",$5"  ",$6}'
} >> $DISK_FILE

# End of script =======
