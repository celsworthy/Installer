DIR=$(cd "$(dirname "$0")"; pwd)
rm -fr /tmp/AutoMaker.*
cp -r $1/AutoMaker-$2-osx-installer.app /tmp
cd /tmp
mv AutoMaker-$2-osx-installer.app/Contents/MacOS/installbuilder AutoMaker-$2-osx-installer.app/Contents/Resources
mv AutoMaker-$2-osx-installer.app/Contents/MacOS/osx* AutoMaker-$2-osx-installer.app/Contents/Resources
rm AutoMaker-$2-osx-installer.app/Contents/MacOS/installbuilder.sh
cp $DIR/installbuilder.sh AutoMaker-$2-osx-installer.app/Contents/MacOS

mv AutoMaker-$2-osx-installer.app AutoMaker-$2-osx-installer-original.app 

/Applications/BitRock\ InstallBuilder\ Professional\ 9.5.2/tools/code-signing/osx/osxsigner --identity "3rd Party Mac Developer Application" --identifier "celtech.AutoMaker" --output /tmp AutoMaker-$2-osx-installer-original.app/

mv AutoMaker-$2-osx-installer-original-signed.app AutoMaker-$2-osx-installer.app 

zip -r AutoMaker-$2-osx-installer.app.zip AutoMaker-$2-osx-installer.app/

#scp -i ~/.ssh/BuildServer.pem /tmp/AutoMaker-$2-osx-installer.app.zip ubuntu@downloads.cel-robox.com:/home/ubuntu
