#Requires AutoHotkey v2.0

; # Windows
; ^ Ctrl
; ! Alt
; + Shift

; Icon
TraySetIcon "shell32.dll", 277

; Win + Enter = Launch / focus Windows Terminal
#Enter::
{
    if WinExist("ahk_exe WindowsTerminal.exe")
        WinActivate
    else
        Run("wt.exe")
}

; Win + Q = Close active window
#q::WinClose("A")

; Win + W = Launch Microsoft Edge
#w::Run("msedge.exe")

; Alt + 1 / Alt + 2 = Type email from untracked keybinds.local.ini
!1::TypeEmail(1)
!2::TypeEmail(2)

TypeEmail(n)
{
    ini := A_ScriptDir "\keybinds.local.ini"
    email := FileExist(ini) ? IniRead(ini, "emails", n, "") : ""

    if (email = "")
    {
        ToolTip("No email configured for Alt+" n "`nCreate " ini)
        SetTimer(() => ToolTip(), -2500)
        return
    }

    SendText(email)
}
