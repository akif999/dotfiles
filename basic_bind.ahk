; hjkl keybind
vk1D & h:: Send,{Blind}{Left}
vk1D & j:: Send,{Blind}{down}
vk1D & k:: Send,{Blind}{up}
vk1D & l:: Send,{Blind}{right}

; Home End PgUp PgDn
vk1D & a:: Send,{Blind}{Home}
vk1D & e:: Send,{Blind}{End}
vk1D & u:: Send,{Blind}{PgUp}
vk1D & d:: Send,{Blind}{PgDn}

; Kana/Eisuu
vk1C:: Send,{vkF3}

; Enter
^m::
    send, {Enter}
return

; BackSpace
Ctrl & h:: Send,{BackSpace}

; Delete
vk1D & BackSpace:: Send,{Blind}{Delete}

; Click
vk1D & v::Mouseclick,left,,,,,D
vk1D & v up::Mouseclick,left,,,,,U
vk1D & b:: Send,{Blind}{RButton}

; date
^;::
    FormatTime,Time,,yyyyMMdd
    Send,%Time%
    Return

; ApplicationLaunch
!t::
    Run, C:\Users\aki01\work\app\cltc\cltc.exe
    Return

; AHK script edit
vk1D & c::Run, "%USERPROFILE%\work\app\vim\gvim.exe" "%USERPROFILE%\work\src\github.com\akif999\dot-files\basic_bind.ahk"
vk1D & r::Reload
