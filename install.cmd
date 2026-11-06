@echo off
setlocal
title LainOS for Windows - Installer

echo.
echo  LainOS for Windows
echo  ------------------
echo.
echo This installer will ask before installing GlazeWM, YASB, Fastfetch,
echo and JetBrainsMono Nerd Font.
echo Existing configuration files will be backed up before replacement.
echo.

where powershell.exe >nul 2>nul
if errorlevel 1 (
    echo ERROR: Windows PowerShell was not found.
    pause
    exit /b 1
)

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1"
set "INSTALL_EXIT=%ERRORLEVEL%"

echo.
if not "%INSTALL_EXIT%"=="0" (
    echo LainOS setup ended with an error. Review the messages above.
    pause
    exit /b %INSTALL_EXIT%
)

echo LainOS setup finished.
echo Restart GlazeWM and YASB after installation.
echo Kitty must be installed separately.
pause
exit /b 0
