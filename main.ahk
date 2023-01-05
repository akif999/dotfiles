#SingleInstance force
SetWorkingDir,%A_ScriptDir%

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

; Enter
Ctrl & m::Send,{Enter}
; hennkan key to hannkaku/zennkaku
sc079::Send,{sc029}
; MUHENKAN + "0" to Delete
; sc07B & BS::Send,{Blind}{Del}
; Cursor using MUHENKAN + IJKL shortcut key
sc07B & h::Send,{Blind}{Left}
sc07B & j::Send,{Blind}{Down}
sc07B & k::Send,{Blind}{Up}
sc07B & l::Send,{Blind}{Right}
; Home, End, PageUp and, PageDown
sc07B & a::Send,{Blind}{Home}
sc07B & d::Send,{Blind}{PgDn}
sc07B & u::Send,{Blind}{PgUp}
sc07B & e::Send,{Blind}{End}
; Backspace
Ctrl & h::Send,{BS}
; line delete
; sc07B & d::Send,{Home}+{End}{Del}
; Mouse
sc07B & v::MouseClick, left,,,,,D
sc07B & v up::MouseClick, left,,,,,U
sc07B & b::MouseClick, right
; Raunch Programs
!g::
Process,Exist,gvim.exe
if ErrorLevel<>0
    WinActivate,ahk_pid%ErrorLevel%
else
    Run,C:\Users\aki01\work\vim\netupvim\gvim.exe
return

!r::
    Run,C:\Users\aki01\work\app\rapture-2.4.0\rapture.exe
return

sc07B & t::
    Run,C:\Users\aki01\work\app\cltc\cltc.exe
return

; year month day
!s::
    IfWinActive ChildView; RemoteView
      Formattime,Timestring,,yyyy/MM/dd
      Send,%TimeString%
      Return
!y::
    IfWinActive ChildView; RemoteView
      Formattime,Timestring,,yyyyMMdd
      Send,%TimeString%
      Return
; "http://atcserver/r/"."$Clipboard"
sc07B & 2::
;    Schema := SubStr(%Clipboard%, 1, 4)
    Clipboard = [file://%CLipboard%](http://atcserver/r/file://%Clipboard%)
;    Send, %Clipboard%
    Return

; AlwaysOnTop
sc07B & 1::Winset,AlwaysOnTop,TOGGLE,A
; ToggleApp()
sc07B & Tab::ToggleApp()

ToggleApp() {
    global toggle_app_list

    ToggleAppPushCurrentApp()

    For i, x in toggle_app_list {
        WinGetTitle, t, ahk_id %x%
        if (i > 0 && t != "" && !ToggleAppSkip(t)) {
            WinActivate, ahk_id %x%
            ToggleAppPushCurrentApp()
            Break
        }
    }
    ToggleAppDumpApp()
}

; この関数を定期処理に差し込む
ToggleAppPushCurrentApp() {
    global toggle_app_list

    if (!IsObject(toggle_app_list)) {
        toggle_app_list := Object()
    }

    WinGet, app, , A
    app := app + 0
    For i, x in toggle_app_list {
        if (x == app) {
            toggle_app_list.Remove(i)
        }
    }
    toggle_app_list.Insert(0, app)
}

; titleベースでskipする場合はtrueを返す
ToggleAppSkip(title) {
    if (title == "") {
    } else if (title == "スタート メニュー") {
    } else if (title == "タスクの切り替え") {
    } else if (title == "Program Manager") {
    } else if (title == "CLaunch") {
    } else if (title == "cltc ver.0.8.6") {
    } else {
        return false
    }
    return true
}

ToggleAppDumpApp() {
    global toggle_app_list
    str := ""
    cnt := 0
    str := "- active -"
    WinGetPos, X, Y, Width, Height, A
    ToolTip, %str%, %X%, %Y%

    SetTimer, ToggleAppRemoveToolTip, 1000
}

ToggleAppRemoveToolTip:
    SetTimer, ToggleAppRemoveToolTip, Off
    ToolTip
    return
; 標準関数
TimedTrayTip(title, text, time) {
    TrayTip
    TrayTip, %title%, %text%
    SetTimer, RemoveTrayTip, %time%
}

RemoveTrayTip:
    SetTimer, RemoveTrayTip, Off
    TrayTip
    return

MoveCurrentWindow(x_ofs, y_ofs) {
    WinGetPos, X, Y, Width, Height, A
    WinMove, A, , X + x_ofs, Y + y_ofs
}

ResizeCurrentWindow(w_ofs, h_ofs) {
    WinGetPos, X, Y, Width, Height, A
    WinMove, A, , X, Y, Width + w_ofs, Height + h_ofs
}
; 定期処理
SetTimer, PeriodicProcess500ms, 500

PeriodicProcess500ms:
    pp_new_h := A_Hour
    pp_new_m := A_Min
    pp_new_s := A_Sec
    if (pp_new_h != pp_h) {
        PeriodicProcess1hour(pp_new_h, pp_new_m, pp_new_s)
    }
    if (pp_new_m  != pp_m) {
        PeriodicProcess1min(pp_new_h, pp_new_m, pp_new_s)
    }
    if (pp_new_s  != pp_s) {
        PeriodicProcess1sec(pp_new_h, pp_new_m, pp_new_s)
    }
    pp_h := pp_new_h
    pp_m := pp_new_m
    pp_s := pp_new_s
    return

PeriodicProcess1hour(h, m, s) {

}

PeriodicProcess1min(h, m, s) {
    if (h == 12 && m == 30) {
        ; 例) 毎日12:30に定期実行する
    }
}

PeriodicProcess1sec(h, m, s) {
    ToggleAppPushCurrentApp()
}

; AHK Script edit and reload
sc07B & C::
Run "%USERPROFILE%\work\app\vim\gvim.exe" "%USERPROFILE%\work\src\github.com\akif999\dot-files\basic_bind.ahk"
Return

sc07B & R::Reload

