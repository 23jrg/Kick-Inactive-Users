schtasks /delete /tn LogInactiveOff /f
if exist "C:\LogOffInactive" (@RD /S /Q "C:\LogOffInactive")
