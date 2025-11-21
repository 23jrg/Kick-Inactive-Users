pushd %~dp0
if exist "C:\LogOffInactive" (@RD /S /Q "C:\LogOffInactive")
mkdir C:\LogOffInactive
copy /y "LogInactiveOff.ps1" "C:\LogOffInactive"
copy /y "uninstall.bat" "C:\LogOffInactive"
schtasks.exe /Create /XML "Log off inactive users.xml" /tn LogInactiveOff

popd
