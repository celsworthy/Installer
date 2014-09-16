#!/bin/bash
for device in /dev/ttyACM*
do
    name=$1
    id=$2
    if [[ $device = "/dev/ttyACM*" ]]
    then
	echo NOT_CONNECTED
	exit
    fi
    poss=`udevadm info --query=symlink --name=$device | grep -i $name | grep -i $id`
    if [[ $poss ]]
    then
	echo $device >/dev/stdout
	echo " "
    fi
done
