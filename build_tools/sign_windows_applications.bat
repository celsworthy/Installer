signtool sign /v /d "CEL AutoMaker" /f %~dp0CELCodeSigningCert.p12 /p slat3d /t http://timestamp.verisign.com/scripts/timestamp.dll AutoMaker-%1-windows-installer.exe
signtool sign /v /d "CEL Configurator" /debug /f %~dp0CELCodeSigningCert.p12 /p slat3d /t http://timestamp.verisign.com/scripts/timestamp.dll Configurator-%1-windows-installer.exe
signtool sign /v /d "CEL Commissionator" /f %~dp0CELCodeSigningCert.p12 /p slat3d /t http://timestamp.verisign.com/scripts/timestamp.dll %1-windows-installer.exe