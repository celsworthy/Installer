DIR=$(cd "$(dirname "$0")"; pwd)
rm -fr /tmp/AutoMaker.*
cp -r $1/AutoMaker-$2-osx-installer.app /tmp
cd /tmp

/Applications/BitRock\ InstallBuilder\ Professional\ 15.1.0/tools/code-signing/osxsigner --identity "Developer ID Application: C Enterprise (UK) Limited (JGF77G5JSY)" --identifier "celtech.AutoMaker" --output /tmp AutoMaker-$2-osx-installer.app/

rm -fr AutoMaker-$2-osx-installer.app/
mv AutoMaker-$2-osx-installer-signed.app AutoMaker-$2-osx-installer.app 

zip -r AutoMaker-$2-osx-installer.app.zip AutoMaker-$2-osx-installer.app/

scp -i ~/.ssh/BuildServer.pem /tmp/AutoMaker-$2-osx-installer.app.zip ubuntu@downloads.cel-robox.com:/home/ubuntu
