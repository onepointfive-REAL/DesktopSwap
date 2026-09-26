@echo off
title Uninstaller
echo Uninstaller 
echo Must have wind hawk 2.0 beta or higher
echo Run me as admin
echo.
echo Deleting %USERPROFILE%\toggle.bat...
del "%USERPROFILE%\toggle.bat"
echo Disabling switcher...
"%ProgramFiles%\Windhawk\windhawk-cli.exe" mod disable taskbar-primary-on-secondary-monitor
echo Uninstalling windhawk taskbar switcher...
"%ProgramFiles%\Windhawk\windhawk-cli.exe" mod remove taskbar-primary-on-secondary-monitor --yes
echo Deleting task...
schtasks /delete /tn "Toggle Bar" /f
echo Deleting desktop shortcut (you need to manually remove from taskbar)...
del "%USERPROFILE%\Desktop\Toggle Bar.lnk"
echo Restarting explorer...
taskkill /f /im explorer.exe
start explorer.exe
echo Done!
pause