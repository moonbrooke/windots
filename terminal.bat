@echo off
setlocal

set "LINK=%USERPROFILE%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
set "TARGET=C:\GitHub\windots\starship\starship.toml"

mklink "%LINK%" "%TARGET%"
