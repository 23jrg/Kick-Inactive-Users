FSUTIL DIRTY query %SystemDrive% >NUL || (
    PowerShell "Start-Process -FilePath '%0' -Verb RunAs"
    EXIT
)

REM Checks to see if the script was already ran and removes leftover files
if exist "C:\LogInactiveOff" (@RD /S /Q "C:\LogInactiveOff")

REM Creates the resource folder
mkdir C:\LogInactiveOff

REM Changed the path to the working directory
pushd %~dp0

REM Moves the powershell script and scheduled task to the resources folder
copy /y "uninstaller.bat" "C:\LogInactiveOff"
copy /y "LogInactiveOff.xml" "C:\LogInactiveOff"

REM Resets the path to default
popd

REM Creates the scheduled task to automatically trigger when someone logs in, run in powershell to avoid false positives
powershell -Command "schtasks.exe /Create /XML 'C:\LogInactiveOff\LogInactiveOff.xml' /tn LogInactiveOff"


