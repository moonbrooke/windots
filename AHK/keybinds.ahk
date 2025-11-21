#Requires AutoHotkey v2.0

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
