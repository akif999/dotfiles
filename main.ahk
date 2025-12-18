#SingleInstance force
SetWorkingDir,%A_ScriptDir%
#Include %A_ScriptDir%

; tile は先頭へ展開しなければ動作しないため注意
#Include tile.ahk

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

; AlwaysOnTop
sc07B & 1::Winset,AlwaysOnTop,TOGGLE,A

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
;    IfWinActive ChildView; RemoteView
      Formattime,Timestring,,yyyy/MM/dd
      Send,%TimeString%
      Return
!y::
;    IfWinActive ChildView; RemoteView
      Formattime,Timestring,,yyyyMMdd
      Send,%TimeString%
      Return

sc07B & Tab::ToggleApp()
#Include toggle_app.ahk

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

