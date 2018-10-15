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
	scan_ssid=1\n\
	ssid=\"$ssid\"\n\
	psk=\"$pw\"\n\
${endOfSection}" $fileToChange 
	else
		sudo sed -i "$ a ${startOfSection}\n\
	scan_ssid=1\n\
	ssid=\"$ssid\"\n\
	psk=\"$pw\"\n\
${endOfSection}" $fileToChange
	fi
	sudo ip link set wlan0 down > /dev/null 2>&1
	# Try to force wpa-supplicant to restart with the new configuration.
	# At least one person on the interweb claimed this worked!
	sudo systemctl daemon-reload
	sudo systemctl restart dhcpcd
	# Allow time for changes to come into effect.
	sleep 1
	# Bring up the interface.
	sudo ip link set wlan0 up > /dev/null 2>&1
	# Allow time for changes to come into effect.
	sleep 10
fi
