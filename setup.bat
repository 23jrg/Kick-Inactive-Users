REM Checks to see if the script was already ran and removes leftover files
if exist "C:\LogOffInactive" (@RD /S /Q "C:\LogOffInactive")

REM Creates the resource folder
mkdir C:\LogOffInactive

REM Changed the path to the working directory
pushd %~dp0

REM Moves the powershell script and scheduled task to the resources folder
copy /y "LogInactiveOff.ps1" "C:\LogOffInactive"
copy /y "Log off inactive users.xml" "C:\LogOffInactive"

REM Creates a shortcut to the uninstaller so the uninstaller can remove the resource folder without being inside it
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('c:\LogOffInactive\uninstall.lnk');$s.TargetPath='%userprofile%\Kick-Inactive-Users\uninstall.bat';$s.Save()"

REM Resets the path to default
popd

REM Creates the scheduled task to automatically trigger when someone logs in
schtasks.exe /Create /XML "C:\LogOffInactive\Log off inactive users.xml" /tn LogInactiveOff




