@echo off
set "windhawkexe=%~dp0windhawk_setup_offline_alpha_6.exe"
:: Check for admin privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Your admin commands go below
echo.
echo Running as Administrator...
:restart
echo.
echo =================
echo Desktop Swap
echo =================
echo.
echo Choices
echo 1. Install online (online windhawk repository)
echo 2. Install offline (source.cpp)
echo 3. Uninstall online
echo 4. Uninstall offline
echo 5. Install Windhawk Alpha 6 (offline)
echo 6. Exit
echo.
set /p choice=Select: 
if "%choice%"=="1" (goto installonline) ELSE goto other
:other
if "%choice%"=="2" (goto installoffline) ELSE goto other1
:other1
if "%choice%"=="3" (goto uninstalloffline) ELSE goto other2
:other2
if "%choice%"=="4" (goto uninstalloffline) ELSE goto other3
:other3
if "%choice%"=="5" (goto installwindhawk) ELSE goto other4
:other4
if "%choice%"=="6" (goto exit) ELSE goto other5
:other5
echo.
echo Not a choice.
timeout /NOBREAK /t 3 > nul
cls
goto restart
:installonline
echo.
cls
call "%~dp0installswitcher.bat"
cls
goto restart
:installoffline
echo.
cls
call "%~dp0installswitcheroffline.bat"
cls
goto restart
:uninstallonline
echo.
cls
call "%~dp0uninstall.bat"
cls
goto restart
:uninstalloffline
echo.
cls
call "%~dp0uninstalloffline.bat"
cls
goto restart
:installwindhawk
cls
echo.
echo WARNING: Do you trust me distributing windhawk? (third party!!!)
echo.
echo Choices
echo 1. Don't install
echo 2. Install Windhawk
echo.
set /p choice=Select: 
if "%choice%"=="2" (goto continuewindhawk) ELSE goto saidno
:saidno
echo.
echo Fair point!
timeout /NOBREAK /t 3 > nul
cls
goto restart
:continuewindhawk
start "" "%windhawkexe%"
cls
goto restart
:exit
