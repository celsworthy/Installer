#!/bin/bash

rootUpgradeFileBase="/tmp/RootARM*"

logger Checking for Robox Root upgrade files
#Handle pre-run upgrade
for f in $rootUpgradeFileBase; do
    if [ -e "$f" ]
    then
	upgradeFile=$(ls -t $rootUpgradeFileBase | head -1)
	logger Found $upgradeFile - upgrading Robox Root
	unzip -o -d /home/pi/ $upgradeFile
	rm -f $rootUpgradeFileBase
    fi
    break
done

java/bin/java -Dglass.platform=Monocle -Dmonocle.platform=Headless -Djava.net.preferIPv4Stack=true -DlibertySystems.configFile=Root.configFile.xml -jar Root.jar server Root.yml
