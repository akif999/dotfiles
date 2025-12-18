; tile
SetTitleMatchMode, 2
DetectHiddenWindows, On
+#Left::
+#Right::
+#Up::
+#Down::
#Left::
#Right::
#Up::
#Down::
; #Esc::
#@::
    ; X軸 or Y軸方向を半分サイズに
    WinGet, WID, ID, A
    WinGet, isMaximize, MinMax, ahk_id %WID%
    WinGetPos, NowX, NowY, NowW, NowH, ahk_id %WID%

    if (isMaximize == 1) {
        WinRestore, ahk_id %WID%
        NowX += 8
        NowY += 8
        NowW -= 16
        NowH -= 16
    } else if (RegExMatch(A_ThisHotkey, "^#")) {
        ; shift無しの場合は、画面に対しての半分の領域を確保する
        Gui, New
        Gui, +MaximizeBox
        Gui, Show, hide W%NowW% H%NowH% X%NowX% Y%NowY%, __maximize__

        WinGet, WID_MAXIMIZE, ID, __maximize__
        WinSet, Transparent, 10, ahk_id %WID_MAXIMIZE%
        WinMaximize, ahk_id %WID_MAXIMIZE%

        WinGetPos, NowX, NowY, NowW, NowH, ahk_id %WID_MAXIMIZE%
        Sleep, 50
        Gui, Destroy
    } else {
        ; doesn't match anything
    }

    if (RegExMatch(A_ThisHotkey, "Left")) {
        NowW := NowW / 2
    } else if (RegExMatch(A_ThisHotkey, "Right")) {
        NowX := NowX + (NowW / 2)
        NowW := NowW / 2
    } else if (RegExMatch(A_ThisHotkey, "Up")) {
        NowH := NowH / 2
    } else if (RegExMatch(A_ThisHotkey, "Down")) {
        NowY := NowY + (NowH / 2)
        NowH := NowH / 2
    } else if (RegExMatch(A_ThisHotkey, "@")) {
        ; maximize
    } else if (RegExMatch(A_ThisHotkey, "Esc")) {
        ; minimize(not implementing)
    }

    WinMove, ahk_id %WID%, , %NowX%, %NowY%, %NowW%, %NowH%
    return
#Esc::
    Winminimize, A
    return
; recover window position
#\::
    WinGet, id, list, , , Program Manager
    Loop %id%
    {
        StringTrimRight, this_id, id%A_Index%, 0
        WinActivate, ahk_id %this_id%
        WinGetClass, this_class, ahk_id %this_id%
        WinGetTitle, this_title, ahk_id %this_id%
        MsgBox, 4, Visiting All Windows`n%A_Index% of %id%`nahk_class %htis_class%`n%this_title%`n`nContinue?
        IfMsgBox, NO, Break
    }
    return
