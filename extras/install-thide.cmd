@echo off
setlocal
title LainOS - Optional THide Download

set "DEST=%USERPROFILE%\Downloads\thide-0.1.3-x64-portable"
set "ZIP=%TEMP%\thide-0.1.3-x64-portable.zip"
set "URL=https://github.com/amnweb/thide/releases/download/v0.1.3/thide-0.1.3-x64-portable.zip"

echo.
echo Downloading official THide 0.1.3 portable release...
echo This is optional and is not required by LainOS.
echo.

where curl.exe >nul 2>nul
if errorlevel 1 (
    echo ERROR: curl.exe was not found. Use Windows 10/11 with the built-in curl command.
    pause
    exit /b 1
)

where tar.exe >nul 2>nul
if errorlevel 1 (
    echo ERROR: tar.exe was not found.
    pause
    exit /b 1
)

if not exist "%DEST%" mkdir "%DEST%"
curl.exe -fL --retry 3 "%URL%" -o "%ZIP%"
if errorlevel 1 (
    echo ERROR: Download failed. Use the official release page:
    echo https://github.com/amnweb/thide/releases/tag/v0.1.3
    pause
    exit /b 1
)

tar.exe -xf "%ZIP%" -C "%DEST%"
if errorlevel 1 (
    echo ERROR: Could not extract the archive.
    pause
    exit /b 1
)

if not exist "%DEST%\thide.exe" (
    echo ERROR: thide.exe was not found after extraction.
    echo Inspect the downloaded archive manually.
    pause
    exit /b 1
)

echo.
echo THide extracted to:
echo %DEST%
echo.
echo Run thide.exe manually when you want to hide the taskbar.
echo Autostart is not enabled automatically.
pause
exit /b 0
