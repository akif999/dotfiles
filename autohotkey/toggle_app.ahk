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

