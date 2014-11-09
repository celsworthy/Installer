/Applications/BitRock\ InstallBuilder\ Professional\ 9.5.2/tools/code-signing/osx/osxsigner --identity "3rd Party Mac Developer Application" --identifier "celtech.AutoMaker" --output /tmp $1/AutoMaker-$2-osx-installer.app/

zip -r /tmp/AutoMaker-$2-osx-installer.app.zip /tmp/AutoMaker-$2-osx-installer.app/

scp -i ~/.ssh/BuildServer.pem /tmp/AutoMaker-$2-osx-installer.app.zip ubuntu@downloads.cel-robox.com:/home/ubuntu
