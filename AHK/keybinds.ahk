#Requires AutoHotkey v2.0

; # Windows
; ^ Ctrl
; ! Alt
; + Shift

; Icon
TraySetIcon "shell32.dll", 277

; Sibling files (zoomy_mouse.ahk, keybinds.local.ini) must be looked up in this
; folder even when the script is launched from the Startup symlink created by
; keybinds.bat, because A_ScriptDir is then the Startup folder instead.
ScriptDir()
{
    static dir := ""
    if (dir != "")
        return dir

    dir := A_ScriptDir

    ; CreateFileW(path, 0, share read/write/delete, 0, OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, 0)
    hFile := DllCall("CreateFileW", "Str", A_ScriptFullPath, "UInt", 0, "UInt", 7, "Ptr", 0
        , "UInt", 3, "UInt", 0x02000000, "Ptr", 0, "Ptr")

    if (hFile != -1)
    {
        buf := Buffer(65536, 0)
        if DllCall("GetFinalPathNameByHandleW", "Ptr", hFile, "Ptr", buf, "UInt", 32768, "UInt", 0, "UInt")
        {
            resolved := StrReplace(StrReplace(StrGet(buf), "\\?\UNC\", "\\"), "\\?\", "")
            SplitPath(resolved, , &realDir)
            if (realDir != "")
                dir := realDir
        }
        DllCall("CloseHandle", "Ptr", hFile)
    }

    return dir
}

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

; Win + Shift + Z = Launch zoomy_mouse.ahk
; zoomy_mouse.ahk uses #SingleInstance Force, so this reloads it if already running
#+z::Run(ScriptDir() "\zoomy_mouse.ahk")

; Alt + 1 / Alt + 2 = Type email from untracked keybinds.local.ini
!1::TypeEmail(1)
!2::TypeEmail(2)

TypeEmail(n)
{
    ini := ScriptDir() "\keybinds.local.ini"
    email := FileExist(ini) ? IniRead(ini, "emails", n, "") : ""

    if (email = "")
    {
        ToolTip("No email configured for Alt+" n "`nCreate " ini)
        SetTimer(() => ToolTip(), -2500)
        return
    }

    SendText(email)
}
