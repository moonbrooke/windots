#Requires AutoHotkey v2.0

; Icon
TraySetIcon "shell32.dll", 277

; Windows + Enter = Windows Terminal 
; #Enter::Run("wt.exe")
#Enter::
{
    if WinExist("ahk_exe WindowsTerminal.exe")
    {
        WinActivate
        WinWaitActive("ahk_exe WindowsTerminal.exe", , 0.5)
        Send("^+t")
    }
    else
    {
        Run("wt.exe")
    }
}

; Windows + Q = Quit current active programs
#q::WinClose("A")
