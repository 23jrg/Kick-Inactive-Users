schtasks /delete /tn LogInactiveOff /f
if exist "C:\LogOffInactive" (@RD /S /Q "C:\LogOffInactive")
del "%userprofile%\desktop\Uninstall_LogOffInactiveAccounts.Ink"
