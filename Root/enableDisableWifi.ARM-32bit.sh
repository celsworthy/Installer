#!/bin/bash
command=down

if [ $1 == 'on' ]
then
   command=up 
else
	./setupWifi.sh clear
fi

sudo if${command} wlan0 > /dev/null 2>&1
