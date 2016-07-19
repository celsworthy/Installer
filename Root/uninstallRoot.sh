#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "The uninstaller must be run as root. Try sudo $0"
    exit 1
fi

serviceFinalDir=/etc/systemd/system
serviceFile=roboxroot.service

systemctl stop ${serviceFile}
systemctl daemon-reload

rm -f ${serviceFinalDir}/${serviceFile}

echo Robox Root Node uninstalled
