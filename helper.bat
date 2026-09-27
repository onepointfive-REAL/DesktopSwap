@echo off
setlocal

set "WH=C:\Program Files\Windhawk\windhawk-cli.exe"
set "MOD=taskbar-primary-on-secondary-monitor"

"%WH%" mod show "%MOD%" > "%TEMP%\windhawk_mod.txt" 2>&1

findstr /C:"State:         enabled" "%TEMP%\windhawk_mod.txt" >nul

if %errorlevel%==0 (
    echo Disabling %MOD%...
    "%WH%" mod disable "%MOD%"
    echo.
    echo Secondary Taskbar: OFF
) else (
    echo Enabling %MOD%...
    "%WH%" mod enable "%MOD%"
    echo.
    echo Secondary Taskbar: ON
)

del "%TEMP%\windhawk_mod.txt" >nul 2>&1
timeout /t 2 >nul
