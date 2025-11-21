#Requires AutoHotkey v2.0

; Create overlay GUI
overlay := Gui("+AlwaysOnTop -Caption +ToolWindow +Border")
overlay.BackColor := "1a1b26"
overlay.SetFont("s16 cc0caf5", "CaskaydiaMono Nerd Font")
txt := overlay.AddText("w400 h60 Center vKeyText", "")
overlay.Show("x1430 y900 NoActivate")

ShowKey(key) {
    global overlay, txt
    ; Append instead of replace
    txt.Value .= (txt.Value ? "  " : "") . key
    overlay.Show("NoActivate")

    ; Reset timer each time a key is added
    SetTimer(ClearKeys, -1500) ; clear after 1.5s
}

ClearKeys() {
    global txt
    txt.Value := ""
}

; The keys
~*a::ShowKey("A")
~*b::ShowKey("B")
~*c::ShowKey("C")
~*d::ShowKey("D")
~*e::ShowKey("E")
~*f::ShowKey("F")
~*g::ShowKey("G")
~*h::ShowKey("H")
~*i::ShowKey("I")
~*j::ShowKey("J")
~*k::ShowKey("K")
~*l::ShowKey("L")
~*m::ShowKey("M")
~*n::ShowKey("N")
~*o::ShowKey("O")
~*p::ShowKey("P")
~*q::ShowKey("Q")
~*r::ShowKey("R")
~*s::ShowKey("S")
~*t::ShowKey("T")
~*u::ShowKey("U")
~*v::ShowKey("V")
~*w::ShowKey("W")
~*y::ShowKey("X")
~*z::ShowKey("Z")

~*0::ShowKey("0")
~*1::ShowKey("1")
~*2::ShowKey("2")
~*3::ShowKey("3")
~*4::ShowKey("4")
~*5::ShowKey("5")
~*6::ShowKey("6")
~*7::ShowKey("7")
~*8::ShowKey("8")
~*9::ShowKey("9")

~*-::ShowKey("-")
~*=::ShowKey("=")

~*Enter::ShowKey("Enter")
~*Esc::ShowKey("Escape")
~*Tab::ShowKey("Tab")
~*Space::ShowKey("Space")
~*LWin::ShowKey("Win")
~*Shift::ShowKey("Shift")
~*Ctrl::ShowKey("Ctrl")
~*Alt::ShowKey("Alt")
~*BS::ShowKey("BackSpace")
~*Left::ShowKey("Left")
~*Down::ShowKey("Down")
~*Up::ShowKey("Up")
~*Right::ShowKey("Right")
