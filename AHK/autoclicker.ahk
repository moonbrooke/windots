#Requires AutoHotkey v2.0
#SingleInstance Force

IniFile := A_ScriptDir "\settings.ini"

global IsClicking := false

global CurrentHotkey := IniRead(IniFile, "Settings", "Hotkey", "F8")
global MinDelay := IniRead(IniFile, "Settings", "MinDelay", 80)
global MaxDelay := IniRead(IniFile, "Settings", "MaxDelay", 140)

; GUI
SettingsGui := Gui("+AlwaysOnTop", "Natural Autoclicker")
SettingsGui.OnEvent("Close", (*) => ExitApp())

SettingsGui.Add("Text", "w200", "Toggle Hotkey:")
HK_Input := SettingsGui.Add("Hotkey", "w200 vHK", CurrentHotkey)

SettingsGui.Add("Text", "w200 y+15", "Min Delay (ms):")
Min_Input := SettingsGui.Add("Edit", "w200 vMin Number", MinDelay)

SettingsGui.Add("Text", "w200 y+15", "Max Delay (ms):")
Max_Input := SettingsGui.Add("Edit", "w200 vMax Number", MaxDelay)

ApplyBtn := SettingsGui.Add("Button", "w200 y+20 default", "Apply Settings")
ApplyBtn.OnEvent("Click", ApplySettings)

SettingsGui.SetFont("s12 bold")
StatusText := SettingsGui.Add("Text", "w200 y+15 center cRed", "Status: OFF")

SettingsGui.Show("AutoSize Center")

try {
    Hotkey(CurrentHotkey, ToggleClicker)
} catch {
    MsgBox("Invalid hotkey found in INI file. Reverting to F8.", "Initialization Error", "Icon!")
    CurrentHotkey := "F8"
    HK_Input.Value := "F8"
    Hotkey("F8", ToggleClicker)
}

; Main

ApplySettings(*) {
    global CurrentHotkey, MinDelay, MaxDelay, IniFile
    
    Saved := SettingsGui.Submit(false)

    if (Saved.Min > Saved.Max) {
        MsgBox("Min delay cannot be greater than Max delay.", "Configuration Error", "IconX")
        return
    }

    if (Saved.HK != "" && Saved.HK != CurrentHotkey) {
        try {
            Hotkey(CurrentHotkey, "Off")          ; Unbind old
            Hotkey(Saved.HK, ToggleClicker, "On") ; Bind new
            CurrentHotkey := Saved.HK
        } catch {
            MsgBox("Invalid hotkey selected. Please choose another.", "Binding Error", "IconX")
            HK_Input.Value := CurrentHotkey       ; Revert GUI field to old working key
            return
        }
    }

    MinDelay := Saved.Min
    MaxDelay := Saved.Max
    
    ; Save to to ini file
    IniWrite(CurrentHotkey, IniFile, "Settings", "Hotkey")
    IniWrite(MinDelay, IniFile, "Settings", "MinDelay")
    IniWrite(MaxDelay, IniFile, "Settings", "MaxDelay")

    ToolTip("Settings Applied & Saved!")
    SetTimer(() => ToolTip(), -1500)
}

ToggleClicker(*) {
    global IsClicking
    IsClicking := !IsClicking

    if (IsClicking) {
        StatusText.Value := "Status: ON"
        StatusText.Opt("cGreen")
        ClickAction()
    } else {
        StatusText.Value := "Status: OFF"
        StatusText.Opt("cRed")
        SetTimer(ClickAction, 0)
    }
}

ClickAction() {
    global IsClicking, MinDelay, MaxDelay

    if (!IsClicking)
        return

    Click()

    nextDelay := Random(MinDelay, MaxDelay)

    if (IsClicking)
        SetTimer(ClickAction, -nextDelay)
}
