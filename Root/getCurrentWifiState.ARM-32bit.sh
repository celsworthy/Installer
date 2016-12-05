#!/bin/bash
poweredInput=$(sudo ifdown -n wlan0 2>&1 | sed 's/^[ \t]*//;s/[ \t]*$//' | awk '{print tolower($0)}' )
associatedInput=$(iwconfig wlan0 | cut -d ' ' -f15 | sed 's/^[ \t]*//;s/[ \t]*$//' )
ssid=$(iwgetid wlan0 | cut -d : -f2 | sed 's/^[ \t]*//;s/[ \t]*$//')

powered='off'
if [[ ${poweredInput} != *"not configured"* ]]
then
   powered='on'	
fi

associated='no'
if [[ ${associatedInput} != *"Not-Associated"* ]]
then
   associated='yes'	
fi

echo {\"power\":\"${powered}\", \"associated\":\"${associated}\", \"ssid\":${ssid}}
