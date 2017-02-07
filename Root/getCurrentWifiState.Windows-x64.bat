@echo off
set isConnected=
for /f "tokens=2*delims=: " %%a in ('netsh wlan show interfaces ^| findstr State') do @set isConnected=%%a

set radioStatus=
for /f "tokens=2*delims=:" %%a in ('netsh wlan show interfaces ^| findstr Radio') do @set radioStatus=%%a

set ssid=
for /f "tokens=2*delims=: " %%a in ('netsh wlan show interfaces ^| findstr /C:" SSID"') do @set ssid=%%a

set associated=no
set powered=off

if "%isConnected%"=="connected" (
	set associated=yes
	set powered=on
) else (
	if "%radioStatus%"==" Hardware On" (
		set powered=on
	)
)

echo {\"power\":\"%powered%\", \"associated\":\"%associated%\", \"ssid\":\"%ssid%\"}