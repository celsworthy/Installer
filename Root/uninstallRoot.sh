#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "The uninstaller must be run as root. Try sudo $0"
    exit 1
fi

serviceDir=/lib/systemd/system
serviceFinalDir=/etc/systemd/system
serviceFile=roboxroot.service

sysctl ${serviceFile} stop
rm -f ${serviceDir}/${serviceFile}
rm -f ${serviceFinalDir}/${serviceFile}

echo Robox Root Node uninstalled
