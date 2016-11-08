#!/bin/bash

rootUpgradeFileBase="/tmp/RootARM*"

#Handle pre-run upgrade
for f in $rootUpgradeFileBase; do
    if [ -e "$f" ]
    then
	upgradeFile=$(ls -t $rootUpgradeFileBase | head -1)
	echo unzip $upgradeFile -d ..
	rm -f $rootUpgradeFileBase
    fi
    break
done

java/bin/java -Dglass.platform=Monocle -Dmonocle.platform=Headless -Djava.net.preferIPv4Stack=true -DlibertySystems.configFile=Root.configFile.xml -jar Root.jar server Root.yml
