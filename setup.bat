if exist "C:\LogOffInactive" (@RD /S /Q "C:\LogOffInactive")
mkdir C:\LogOffInactive
pushd %~dp0
copy /y "LogInactiveOff.ps1" "C:\LogOffInactive"
copy /y "uninstall.bat" "C:\LogOffInactive"
popd
schtasks.exe /Create /XML "Log off inactive users.xml" /tn LogInactiveOff



