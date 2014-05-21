/opt/installbuilder-9.0.1/bin/builder build ./AutoMaker.xml osx
set -x
ls -al LatestBuilds

cd LatestBuilds
ls -al
zip -v -r AutoMaker-osx-installer.app AutoMaker-0.10.07-osx-installer.app
#rm -rf LatestBuilds/AutoMaker-0.10.07-osx-installer.app
