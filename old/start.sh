#!/bin/bash

# if [ ! -e /arch/install_command_list.sh ]
# then
while read line
do
    bash -c "$line"
done < /arch/install_command_list.sh
# fi
