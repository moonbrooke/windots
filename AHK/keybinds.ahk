#Requires AutoHotkey v2.0

; # Windows
; ^ Ctrl
; ! Alt
; + Shift

; Icon
TraySetIcon "shell32.dll", 277

; Win + Enter = Windows Terminal 
; #Enter::Run("wt.exe")
#Enter::
{
    if WinExist("ahk_exe WindowsTerminal.exe")
    {
        WinActivate
    }
    else
    {
        Run("wt.exe")
    }
}

; Win + Q = Quit current active programs
#q::WinClose("A")
