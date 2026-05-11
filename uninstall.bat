FSUTIL DIRTY query %SystemDrive% >NUL || (
    PowerShell "Start-Process -FilePath '%0' -Verb RunAs"
    EXIT
)

schtasks /delete /tn LogInactiveOff /f
rmdir /S /Q C:\LogInactiveOff
del %userprofile%\desktop\Uninstall_LogOffInactiveAccounts.lnk
