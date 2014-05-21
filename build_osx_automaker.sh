/opt/installbuilder-9.0.1/bin/builder build ./AutoMaker.xml osx
ls -al LatestBuilds
zip -v -r LatestBuilds/AutoMaker-0.10.07-osx-installer.app LatestBuilds/AutoMaker-0.10.07-osx-installer.app
#rm -rf LatestBuilds/AutoMaker-0.10.07-osx-installer.app
