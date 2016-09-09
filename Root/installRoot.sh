#!/bin/bash
serviceFinalDir=/etc/systemd/system
serviceFile=roboxroot.service
installDir=`pwd`

echo ${installDir}

if [ "$(id -u)" != "0" ]; then
    echo "The installer must be run as root. Try sudo $0"
    exit 1
fi

function outputToServiceFile
{
    echo $1 >> ${serviceFinalDir}/${serviceFile}
}

cp -R html/ /var/www/

rm -f ${serviceFinalDir}/${serviceFile}

outputToServiceFile '[Unit]'
outputToServiceFile 'Description=Robox Root Node'
outputToServiceFile 'After=syslog.target network.target remote-fs.target nss-lookup.target'
outputToServiceFile '[Service]'
outputToServiceFile 'Type=simple'
outputToServiceFile "WorkingDirectory=${installDir}"
outputToServiceFile "ExecStart=${installDir}/runRoot.sh"
outputToServiceFile 'Restart=on-failure'
outputToServiceFile 'LimitNOFILE=10000'
outputToServiceFile '[Install]'
outputToServiceFile 'WantedBy=multi-user.target'

systemctl daemon-reload
systemctl start ${serviceFile}

echo Installed Robox Root Node
