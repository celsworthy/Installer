#!/bin/bash
java/bin/java -Djava.net.preferIPv4Stack=true -DlibertySystems.configFile=Root.configFile.xml -jar Root.jar server Root.yml
