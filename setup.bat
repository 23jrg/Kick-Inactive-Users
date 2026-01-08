REM Checks to see if the script was already ran and removes leftover files
if exist "C:\LogInactiveOff" (@RD /S /Q "C:\LogInactiveOff")

REM Creates the resource folder
mkdir C:\LogInactiveOff

REM Changed the path to the working directory
pushd %~dp0

REM Moves the powershell script and scheduled task to the resources folder
copy /y "LogInactiveOff.ps1" "C:\LogInactiveOff"
copy /y "uninstall.bat" "C:\LogInactiveOff"
copy /y "Log off inactive users.xml" "C:\LogInactiveOff"

$WshShell = New-Object -COMObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Uninstall_LogOffInactiveAccounts.lnk")
$Shortcut.TargetPath = "C:\LogInactiveOff\uninstall.bat"
$Shortcut.Save()

if exist "%home\desktop\Install_LogOffInactiveAccounts.lnk" (@RD /S /Q "%home\desktop\Install_LogOffInactiveAccounts.lnk")

REM Creates a shortcut to the uninstaller so the uninstaller can remove the resource folder without being inside it
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('c:\LogOffInactive\uninstall.lnk');$s.TargetPath='%tmp%\Kick-Inactive-Users\uninstall.bat';$s.Save()"

REM Resets the path to default
popd

REM Creates the scheduled task to automatically trigger when someone logs in
schtasks.exe /Create /XML "C:\LogOffInactive\Log off inactive users.xml" /tn LogInactiveOff






