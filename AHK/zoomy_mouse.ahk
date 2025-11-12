; Mofified Version
; Original on https://www.autohotkey.com/boards/viewtopic.php?f=83&t=134936
#Requires AutoHotkey v2+
#SingleInstance Force
TraySetIcon "Shell32.dll", 23

F1:: Loupe.Toggle()
+F1:: Loupe.Reset()
!F1:: Loupe.ToggleFormat()
+WheelUp:: Loupe.MagnificationFactor := Min(Loupe.MagnificationFactor + 0.5, 10)
+WheelDown:: Loupe.MagnificationFactor := Max(Loupe.MagnificationFactor - 0.5, 1.5)
+^WheelUp:: Loupe.LensSize := Min(Loupe.LensSize + 50, 1000)
+^WheelDown:: Loupe.LensSize := Max(Loupe.LensSize - 50, 250)

/**
 * Special thanks to RockssJoke for the doing all the hardwork
 * https://www.autohotkey.com/boards/viewtopic.php?f=83&t=134936
 * Special thanks to Wilkster for their contributions
 * 
 * Panaku took what they made, optimized it some and turned it into a class
 */
class Loupe {
    static MagnificationFactor := 3, LensSize := 750
    static BorderWidth := 2, BorderColor := "fdff93"
    static Gui := 0, hMemDC := 0, hObm := 0, hBitmap := 0, hDC := 0
    static PrevLoc := Buffer(8, 0), UpdateTimer := ObjBindMethod(Loupe, "Update")
    static LenFormat := "Circle"

    static Magnify(LensSize := Loupe.LensSize, MagnificationFactor := Loupe.MagnificationFactor, BorderWidth := Loupe.BorderWidth, BorderColor := Loupe.BorderColor) {
        if (Loupe.Gui) {
            if ((LensSize = Loupe.LensSize) && (MagnificationFactor = Loupe.MagnificationFactor) && (BorderWidth = Loupe.BorderWidth) && (BorderColor = Loupe.BorderColor)) {
                return
            } else {
                Loupe.Stop()
            }
        }
        Loupe.LensSize := IsSet(LensSize) && (LensSize >= 75) ? LensSize : Loupe.LensSize
        Loupe.MagnificationFactor := IsSet(MagnificationFactor) && (MagnificationFactor >= 1) ? MagnificationFactor : Loupe.MagnificationFactor
        Loupe.BorderWidth := IsSet(BorderWidth) && (BorderWidth >= 2) ? BorderWidth : Loupe.BorderWidth
        Loupe.BorderColor := IsSet(BorderColor) && IsXDigit(BorderColor) ? BorderColor : Loupe.BorderColor
        Loupe.Gui := Gui("+AlwaysOnTop -Caption +ToolWindow -DPIScale", "myLoupe")
        if (!DllCall("User32\SetWindowDisplayAffinity", "Ptr", Loupe.Gui.Hwnd, "Int", 0x00000011, "Int")) {
            MsgBox("There we an error setting the window affinity", "Error", "262144")
            Loupe.Gui.Destroy(), Loupe.Gui := 0
            return
        }
        Loupe.Gui.Opt("+E0x20 +E0x80000")
        Loupe.Gui.Show("NA x0 y0 w0 h0")
        SetTimer(Loupe.UpdateTimer, 16)
    }

    static Reset() {
        Loupe.Stop()
        Loupe.MagnificationFactor := 2, Loupe.LensSize := 250
        Loupe.BorderWidth := 2, Loupe.BorderColor := "367588"
        Loupe.LenFormat := "Circle"
        Loupe.Magnify()
    }

    static Toggle() {
        if !Loupe.Gui
            this.Magnify()
        else
            this.Stop()
    }

    static ToggleFormat(format := "") {
        Loupe.LenFormat := format != "" ? format : (Loupe.LenFormat = "Circle" ? "Square" : "Circle")
    }

    static Stop() {
        if !Loupe.Gui
            return
        DllCall("SelectObject", "Ptr", Loupe.hMemDC, "Ptr", Loupe.hObm)
        DllCall("Gdi32\DeleteObject", "Ptr", Loupe.hBitmap)
        DllCall("Gdi32\DeleteDC", "Ptr", Loupe.hMemDC)
        DllCall("ReleaseDC", "Ptr", 0, "Ptr", Loupe.hDC)
        SetTimer(Loupe.UpdateTimer, 0)
        Loupe.Gui.Destroy()
        Loupe.Gui := Loupe.hMemDC := Loupe.hObm := Loupe.hBitMap := Loupe.hDC := 0
    }

    static Update() {
        static oldSize := 0
        if (!Loupe.Gui) {
            return SetTimer(Loupe.UpdateTimer, 0)
        }
        if (Loupe.hDC = 0 or Loupe.LensSize != oldSize) {
            oldSize := Loupe.LensSize
            Loupe.hDC := DllCall("GetDC", "Ptr", 0)
            Loupe.hMemDC := DllCall("CreateCompatibleDC", "Ptr", Loupe.hDC)
            Loupe.hBitmap := DllCall("CreateCompatibleBitmap", "Ptr", Loupe.hDC, "Int", Loupe.LensSize, "Int", Loupe.LensSize)
            Loupe.hObm := DllCall("SelectObject", "Ptr", Loupe.hMemDC, "Ptr", Loupe.hBitmap)
            Loupe.hBorderPen := DllCall("Gdi32\CreatePen", "Int", 0, "Int", Loupe.BorderWidth, "UInt", Loupe.ConvertColor(Loupe.BorderColor), "Ptr") ; Colored border pen
            DllCall("Gdi32\SelectObject", "Ptr", Loupe.hMemDC, "Ptr", Loupe.hBorderPen)
            DllCall("Gdi32\SelectObject", "Ptr", Loupe.hMemDC, "Ptr", DllCall("Gdi32\GetStockObject", "Int", 5)) ; Null Brush for center fill in
        }
        try {
            CoordMode("Mouse", "Screen"), MouseGetPos(&mX, &mY)
            SourceSize := Loupe.LensSize / Loupe.MagnificationFactor
            SourceX := Round(mX - (SourceSize / 2)), SourceY := Round(mY - (SourceSize / 2))
            WindowX := Round(mX - (Loupe.LensSize / 2)), WindowY := Round(mY - (Loupe.LensSize / 2))
            NumPut("Int", WindowX, "Int", WindowY, Loupe.PrevLoc)
            DllCall("StretchBlt", "Ptr", Loupe.hMemDC, "Int", 0, "Int", 0, "Int", Loupe.LensSize, "Int", Loupe.LensSize, "Ptr", Loupe.hDC, "Int", SourceX, "Int", SourceY, "Int", SourceSize, "Int", SourceSize, "UInt", 0x00CC0020)
            if Loupe.LenFormat = "Square" {
                DllCall("Gdi32\Rectangle", "Ptr", Loupe.hMemDC, "Int", Loupe.BorderWidth / 2, "Int", Loupe.BorderWidth / 2, "Int", Loupe.LensSize - Loupe.BorderWidth / 2, "Int", Loupe.LensSize - Loupe.BorderWidth / 2)
                WinSetRegion "0-0 w" Loupe.LensSize " h" Loupe.LensSize, "myLoupe"
            } else {
                DllCall("Gdi32\Ellipse", "Ptr", Loupe.hMemDC, "Int", Loupe.BorderWidth / 2, "Int", Loupe.BorderWidth / 2, "Int", Loupe.LensSize - Loupe.BorderWidth / 2, "Int", Loupe.LensSize - Loupe.BorderWidth / 2)
                DllCall("SetWindowRgn", "Ptr", Loupe.Gui.Hwnd, "Ptr", Loupe.CreateCircularRegion(Loupe.LensSize), "Int", 1)
            }
            DllCall("User32\UpdateLayeredWindow", "Ptr", Loupe.Gui.Hwnd, "Ptr", 0, "Ptr", Loupe.PrevLoc, "Int64*", Loupe.LensSize | (Loupe.LensSize << 32), "Ptr", Loupe.hMemDC, "Int64*", 0, "UInt", 0, "UInt*", 0xFF << 16, "UInt", 2)
        }
    }

    static CreateCircularRegion(Size) => DllCall("CreateEllipticRgn", "Int", 0, "Int", 0, "Int", Size, "Int", Size, "Ptr")
    static ConvertColor(BGR) => (RGB := BGR ~= "^0x" ? BGR : "0x" BGR, (((RGB & 0xFF) << 16) | (RGB & 0xFF00) | (RGB >> 16 & 0xFF)))
}
