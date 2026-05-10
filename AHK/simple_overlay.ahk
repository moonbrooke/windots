#Requires AutoHotkey v2.0

; GUI SETUP
OsdGui := Gui("+AlwaysOnTop -Caption +ToolWindow +Disabled +E0x20")
OsdGui.BackColor := "222222"
WinSetTransparent(220, OsdGui)

OsdGui.SetFont("s20 cWhite", "Segoe UI") 

OsdText := OsdGui.Add("Text", "w400 Center", "")

; HOTKEYS
~CapsLock:: {
    Sleep(10)
    state := GetKeyState("CapsLock", "T") ? "ON" : "OFF"
    ShowOSD("Caps Lock: " state)
}

~#Space:: {
    While GetKeyState("LWin", "P") or GetKeyState("RWin", "P") {
        Sleep(10)
    }
    
    Sleep(50)
    lang := GetCurrentLanguageName()
    ; ShowOSD("Language: " lang)
    ShowOSD(lang)
}

; FUNCTIONS
ShowOSD(text) {
    OsdText.Value := text

    yPos := A_ScreenHeight - 150 
    OsdGui.Show("NoActivate xCenter y" yPos)
    
    SetTimer(HideOSD, -1500) 
}

HideOSD() {
    OsdGui.Hide()
}

GetCurrentLanguageName() {
    hwnd := WinActive("A")
    if !hwnd
        return "Unknown"

    threadId := DllCall("GetWindowThreadProcessId", "Ptr", hwnd, "UIntP", 0)
    
    hkl := DllCall("GetKeyboardLayout", "UInt", threadId, "Ptr")
    
    langID := hkl & 0xFFFF

    ; 0x1001 is LOCALE_SENGLISHLANGUAGENAME ("English", Japanese", etc)
    size := DllCall("GetLocaleInfoW", "UInt", langID, "UInt", 0x1001, "Ptr", 0, "Int", 0)
    if !size
        return "LangID: " . langID ; Fallback if not found

    buf := Buffer(size * 2)
    DllCall("GetLocaleInfoW", "UInt", langID, "UInt", 0x1001, "Ptr", buf, "Int", size)
    
    return StrGet(buf, "UTF-16")
}
