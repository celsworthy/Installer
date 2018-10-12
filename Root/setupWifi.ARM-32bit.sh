#!/bin/bash

# Exit code 0 for success and -1 for failure

startOfSection='network={'
endOfSection='}'
fileToChange='/etc/wpa_supplicant/wpa_supplicant.conf'

if [ $1 == "clear" ]
then
	sudo sed -i -e "/$startOfSection/,/$endOfSection/d" $fileToChange
	sudo ip link set wlan0 down > /dev/null 2>&1
else
	ssid=$(echo "$1" | cut -d : -f1)
	pw=$(echo "$1" | cut -d : -f2)
	if sudo grep -q $startOfSection $fileToChange
	then
		sudo sed -i -e "/$startOfSection/,/$endOfSection/c\
		${startOfSection}\n\
	ssid=\"$ssid\"\n\
	psk=\"$pw\"\n\
${endOfSection}" $fileToChange 
	else
		sudo sed -i "$ a ${startOfSection}\n\
	ssid=\"$ssid\"\n\
	psk=\"$pw\"\n\
${endOfSection}" $fileToChange
	fi
	sudo ip link set wlan0 down > /dev/null 2>&1
	# Allow time for changes to come into effect.
	sleep 1
	sudo ip link set wlan0 up > /dev/null 2>&1
	# Allow time for changes to come into effect.
	sleep 6
fi
