@echo off
title Desktop Swap Uninstaller
echo Desktop Swap Uninstaller 
echo Must have wind hawk 2.0 beta or higher
echo Run me as admin
echo.
echo Deleting %USERPROFILE%\DesktopSwap.bat...
del "%USERPROFILE%\DesktopSwap.bat"
echo Disabling switcher...
"%ProgramFiles%\Windhawk\windhawk-cli.exe" mod disable local@taskbar-primary-on-secondary-monitor
echo Uninstalling windhawk taskbar switcher...
"%ProgramFiles%\Windhawk\windhawk-cli.exe" mod remove local@taskbar-primary-on-secondary-monitor --yes
echo Deleting task...
schtasks /delete /tn "Desktop Swap" /f
echo Deleting desktop shortcut (you need to manually remove from taskbar)...
del "%USERPROFILE%\Desktop\Desktop Swap.lnk"
echo Restarting explorer...
taskkill /f /im explorer.exe
start explorer.exe
echo Done!
pause