#!/bin/bash

# [ ! -e "/dev/$1" ] &&
#     echo 'You must specify your device (example: sda)' &&
#     return
# DEST_DEVICE="$1"

[ ! -e "install_command_list.sh" ] &&
    echo 'Missing "install_command_list.sh" file' &&
    return

while read line
do
    echo "$line"
    read;
done < install_command_list.sh
