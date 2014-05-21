/opt/installbuilder-9.0.1/bin/builder build ./AutoMaker.xml osx
set -x
ls -al LatestBuilds
env cd LatestBuilds && zip -v -r AutoMaker-0.10.07-osx-installer.app AutoMaker-0.10.07-osx-installer.app
#rm -rf LatestBuilds/AutoMaker-0.10.07-osx-installer.app
