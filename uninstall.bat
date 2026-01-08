schtasks /delete /tn LogInactiveOff /f
rmdir /S /Q C:\LogInactiveOff
del %userprofile%\desktop\Uninstall_LogOffInactiveAccounts.lnk
