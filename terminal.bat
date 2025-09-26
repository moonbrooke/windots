@echo off
setlocal

set "current=%~dp0"

set "source=%current%terminal\settings.json"
set "destination=%USERPROFILE%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\"

:: Check if file exists
if not exist "%source%" (
    echo Source file not found: %source%
    goto :eof
)

:: Create folder if it doesn't exist
if not exist "%destination%" (
    echo Creating destination folder: %destination%
    mkdir "%destination%"
)

:: Copy file
echo Copying file...
copy "%source%" "%destination%" /Y

echo Done.
endlocal
pause
