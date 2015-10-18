#!/bin/bash

function user ()
{
    export USER=$(whiptail --title "First start configuration" \
		    --inputbox "Enter your username here : " \
		    20 90 \
		    3>&1 1>&2 2>&3)
    [ -z "$USER" ] && return 1
    #useradd -g users -ms /bin/bash "$USER" &> .log || return 1
    echo "${USER}-pc" > /etc/hostname || return 1
    #cp /arch/conf/.xinitrc /arch/conf/.xbindkeysrc /arch/conf/.yaourtrc /home/"$USER"/ &> .log || return 1
    #cat arch/conf/bashrc >> home/"${USER}"/.bashrc || return 1
    #echo -e "tmp\ntmp\n" | passwd "$USER" &> .log || return 1
    #echo "$USER ALL=(ALL) ALL" >> /etc/sudoers || return 1
    return 0
}

function pass ()
{
    export PASS=$(whiptail --title "First start configuration" \
		    --passwordbox "Enter your user password here : " \
		    20 90 3>&1 1>&2 2>&3)
    [ -z "$PASS" ] && return 1
    #su "$USER"-c "echo -e \"tmp\n${PASS}\n${PASS}\n\" | passwd" &> .log || return 1
    return 0
}

function list ()
{
    export PACKAGELIST=$(
	whiptail --title "First start configuration" \
		 --checklist "Check what you want/need to be installed" \
		 20 90 5 \
		 1 "Install the openbox window manager and his additional features" OFF \
		 2 "Install the cinnamon desktop manager" OFF \
		 3 "Install the software base package list (whit terminator, firefox, etc...)" OFF \
		 4 "Install the media additions for audio and bluetooth" OFF \
		 3>&1 1>&2 2>&3
	   )
    export PACKAGELIST=$(
	echo $PACKAGELIST | sed -e "\
s/1/\/arch\/openbox-additionals-packagelist/;\
s/2/\/arch\/cinnamon-additionals-packagelist/;\
s/3/\/arch\/software-base-packagelist/;\
s/4/\/arch\/media-additions-packagelist/;\
" 2> .log)
    [ -z "$PACKAGELIST" ] && export PACKAGELIST="xmonad"
    su "$USER" -c "echo -e \"\n${PASS}\n\" \
		| yaourt -S \$(sed -e \"s/#.*//g;s/[ \t]*$//g\" $PACKAGELIST) \
			 --noconfirm" &> .log || return 1
    #su "$USER" -c "echo -e \"\n${PASS}\n\" | yaourt -Rcns \$(yaourt -Qqdt)" &> .log || return 1
    return 0
}

function run ()
{
    [ -z "$1" ] && return
    $1
    while [ $? -eq 1 ]
    do
	read -p "An error occured, cat .log for more infos
[press enter to retry or Ctrl-C to cancel]"
	$1
    done
}

function deps ()
{
    return 0
}

run user
#
run pass
run list
#exit
run deps

echo $USER
echo $PASS
echo $PACKAGELIST

#rm -rfv /etc/systemd/system/getty.target.wants/getty@tty1.service /etc/systemd/system/autologin@.service
