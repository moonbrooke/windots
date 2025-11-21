#Requires AutoHotkey v2.0

overlay := Gui("+AlwaysOnTop -Caption +ToolWindow +Border")
overlay.BackColor := "1a1b26"
overlay.SetFont("s16 cc0caf5", "CaskaydiaMono Nerd Font")
txt := overlay.AddText("w400 h60 Center vKeyText", "")
overlay.Show("x1430 y900 NoActivate")

pressed := Map()

ShowKey(key, hotkeyName) {
    global overlay, txt, pressed
    if !pressed.Has(hotkeyName) {
        pressed[hotkeyName] := true
        txt.Value .= (txt.Value ? "  " : "") . key
        overlay.Show("NoActivate")
        SetTimer(ClearKeys, -1500)
    }
}

ClearKeys() {
    global txt, pressed
    txt.Value := ""
    pressed.Clear()
}

; Keystrokes
; #a::ShowKey("Win+A", "#a")
; #q::ShowKey("Win+Q", "#q")
; #Enter::ShowKey("Win+Enter", "#Enter")
;
; #a up::pressed.Delete("#a")
; #q up::pressed.Delete("#q")
; #Enter up::pressed.Delete("#Enter")

; All the keys
~*a::ShowKey("A", "a")
~*b::ShowKey("B", "b")
~*c::ShowKey("C", "c")
~*d::ShowKey("D", "d")
~*e::ShowKey("E", "e")
~*f::ShowKey("F", "f")
~*g::ShowKey("G", "g")
~*h::ShowKey("H", "h")
~*i::ShowKey("I", "i")
~*j::ShowKey("J", "j")
~*k::ShowKey("K", "k")
~*l::ShowKey("L", "l")
~*m::ShowKey("M", "m")
~*n::ShowKey("N", "n")
~*o::ShowKey("O", "o")
~*p::ShowKey("P", "p")
~*q::ShowKey("Q", "q")
~*r::ShowKey("R", "r")
~*s::ShowKey("S", "s")
~*t::ShowKey("T", "t")
~*u::ShowKey("U", "u")
~*v::ShowKey("V", "v")
~*w::ShowKey("W", "w")
~*y::ShowKey("X", "x")
~*z::ShowKey("Z", "z")

~*0::ShowKey("0", "0")
~*1::ShowKey("1", "1")
~*2::ShowKey("2", "2")
~*3::ShowKey("3", "3")
~*4::ShowKey("4", "4")
~*5::ShowKey("5", "5")
~*6::ShowKey("6", "6")
~*7::ShowKey("7", "7")
~*8::ShowKey("8", "8")
~*9::ShowKey("9", "9")

~*-::ShowKey("-", "-")
~*=::ShowKey("=", "=")

~*Enter::ShowKey("Enter", "Enter")
~*Esc::ShowKey("Esc", "Esc")
~*Tab::ShowKey("Tab", "Tab")
~*Space::ShowKey("Space", "Space")
~*LWin::ShowKey("Win", "Win")
~*Shift::ShowKey("Shift", "Shift")
~*Ctrl::ShowKey("Ctrl", "Ctrl")
~*Alt::ShowKey("Alt", "Alt")
~*BS::ShowKey("BackSpace", "BackSpace")
~*Left::ShowKey("Left", "Left")
~*Down::ShowKey("Down", "Down")
~*Up::ShowKey("Up", "Up")
~*Right::ShowKey("Right", "Right")
