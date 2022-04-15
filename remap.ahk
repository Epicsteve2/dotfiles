current_layer := "BTD6"
tower_click := false
tower_upgrade := false
btd6_map := "X Factor"
; btd6_map := "Bloonarius Prime"
; btd6_map := "Infernal"
; btd6_map := "Rake"

; sendinput breaks osu editor, some VN's and yea

; dumb syntax -> https://www.autohotkey.com/boards/viewtopic.php?t=66878
layer_list := ["Main"
    ,"Sugar * Style"
    ,"BTD6"
    ,"Dead Omegalul Aegis"
    ,"Rewrite"
    ,"Kinkoi"
    ,"Hatsukoi"
    ,"Hoshi Ori"
    ,"Cafe Stella"
    ,"Cyanotype Daydream"]

map_list := ["Chutes"
    ,"Bazaar"
    ,"Peninsula"
    ,"Underground"
    ,"Cargo"
    ,"Cornfield"
    ,"Flooded Valley"
    ,"X Factor"
    ,"Underground"
    ,"High Finance"
    ,"Adora's Temple"
    ,"Pat's Pond"
    ,"Dark Castle"
    ,"Encrypted"
    ,"Bloonarius Prime"
    ,"Infernal"]

btd6_key_bindings := {"dart": "q"
    , "hero": "u"
    , "tack": "r"
    , "village": "k"
    , "alch": "f"
    , "sniper": "z"
    , "glue": "y"
    , "spike": "j"
    , "sub": "x"
    , "heli": "b"
    , "boomer": "w"
    , "bomb": "e"
    , "ice": "t"
    , "bucc": "c"
    , "ace": "v"
    , "heli": "b"
    , "mortar": "n"
    , "dartling": "m"
    , "wizard": "a"
    , "super": "s"
    , "druid": "g"
    , "farm": "h"
    , "ninja": "d"
    , "engineer": "l"}

keyboard_order := ["q"
    ,"w"
    ,"e"
    ,"r"
    ,"t"
    ,"y"
    ,"u"
    ,"i"
    ,"o"
    ,"p"
    ,"a"
    ,"s"
    ,"d"
    ,"f"
    ,"g"
    ,"h"
    ,"j"
    ,"k"
    ,"l"
    ,"z"
    ,"x"
    ,"c"
    ,"v"
    ,"b"
    ,"n"
    ,"m"]

ChangeLayer() {
    global layer_list
    global current_layer
    global keyboard_order

    Gui, New, ToolWindow, 

    Gui, Font, S15, MesloLGS NF
    Gui, Add, Text, , % "Current layer is: "

    Gui, Font, S15 bold
    Gui, Add, Text, X+0, % current_layer

    Gui, Font, S15 norm
    Gui, Add, Text, XM, % "Select a layer..."

    for index, layer in layer_list {
        Gui, Font, S15 bold
        Gui, Add, Text, XM Y+1, % "  " . keyboard_order[index]

        Gui, Font, S15 norm
        Gui, Add, Text, X+0 , % ": " . layer
    }

    Gui, -Caption +AlwaysOnTop
    Gui, Show, NoActivate AutoSize X1920 Y0,
    Input, key_pressed, L1 T5
    Gui, Destroy

    for index, layer in layer_list {
        if (key_pressed = keyboard_order[index]) {
            current_layer := layer
            
            Gui, New, ToolWindow, 

            Gui, Font, S15, MesloLGS NF
            Gui, Add, Text, , % "Layer: "

            Gui, Font, S15 bold
            Gui, Add, Text, X+0, % layer

            Gui, -Caption +AlwaysOnTop
            Gui, Show, NoActivate AutoSize X1920 Y0,
            sleep, 750
            Gui, Destroy

            Break
        }
    } 
}

ChangeBTD6Map() {
    global btd6_map
    global map_list
    global keyboard_order

    Gui, New, ToolWindow, 

    Gui, Font, S15, MesloLGS NF
    Gui, Add, Text, , % "Current BTD6 map is: "

    Gui, Font, S15 bold
    Gui, Add, Text, X+0, % btd6_map

    Gui, Font, S15 norm
    Gui, Add, Text, XM, % "Select a map..."

    for index, map in map_list {
        Gui, Font, S15 bold
        Gui, Add, Text, XM Y+1, % "  " . keyboard_order[index]

        Gui, Font, S15 norm

        Gui, Add, Text, X+0 , % ": " . map
    }

    Gui, -Caption +AlwaysOnTop
    Gui, Show, NoActivate AutoSize X1920 Y0,
    Input, key_pressed, L1 T5
    Gui, Destroy

    for index, map in map_list {
        if (key_pressed = keyboard_order[index]) {
            btd6_map := map
            
            Gui, New, ToolWindow, 

            Gui, Font, S15, MesloLGS NF
            Gui, Add, Text, , % "BTD6 Map: "

            Gui, Font, S15 bold
            Gui, Add, Text, X+0, % map

            Gui, -Caption +AlwaysOnTop
            Gui, Show, NoActivate AutoSize X1920 Y0,
            sleep, 750
            Gui, Destroy

            Break
        }
    } 
}

discordOrStrawberry() {
    if (WinActive("ahk_exe Discord.exe"))
        launchOrSwitchMusic()
    else
        launchOrSwitchDiscord()
}
launchOrSwitchFirefox() {
    if (WinExist("ahk_exe Discord.exe"))
        WinActivate, ahk_exe firefox.exe
    else
        Run "C:\Users\Stephen\AppData\Local\Mozilla Firefox\firefox.exe"
}
launchOrSwitchDiscord() {
    IfWinExist, ahk_exe Discord.exe
    {
        WinActivate, ahk_exe Discord.exe
    } 
    Else
    {
        Run "C:\Users\Stephen\AppData\Local\Discord\Update.exe"
    }
    Return
}
launchOrSwitchMusic() {
    ; ; Can't find a good way to just activate the music playt
    ; if (WinExist("ahk_exe strawberry.exe"))
    ;     WinActivate, ahk_exe strawberry.exe, , "Strawberry",
    ; else
        Run "C:\Program Files\Strawberry Music Player\strawberry.exe"
    if (WinExist("ahk_exe strawberry.exe"))
        WinActivate, ahk_exe strawberry.exe, , "Strawberry",
}
launchOrSwitchCode() {
    if (WinExist("ahk_exe Code.exe"))
        WinActivate, ahk_exe Code.exe
    Else
        Run "C:\Users\Stephen\AppData\Local\Programs\Microsoft VS Code\Code.exe"
}

clickAndReturn(x, y) {
    SetDefaultMouseSpeed, 0
    MouseGetPos, x_original, y_original 
    Send {Click %x%, %y%}

    ; idk why i need this lol
    ; more info -> //www.autohotkey.com/board/topic/57890-return-mouse-to-original-position-after-auto-click/?p=363564
    CoordMode, Mouse, Screen
    MouseMove, x_original, y_original
    Return
}

GuiTopLeft(string) {
    Gui, New, ToolWindow, 
    Gui, Font, S15, MesloLGS NF
    Gui, Add, Text, , % string
    Gui, -Caption +AlwaysOnTop
    Gui, Show, NoActivate AutoSize X1920 Y0,
    Sleep 750
    Gui, Destroy
}

; RWin::F15
; Calculator
; Launch_App2::Media_Next
; RWin::Media_Play_Pause

; CapsLock::AppsKey

; RWin::AppsKey
; NumpadIns
Pause::f15
Insert::F13
ScrollLock::F14
NumpadDiv::Media_Prev
NumpadMult::Media_Play_Pause
NumpadSub::Media_Next

Numpad0::return
NumpadIns::return
Numpad0 up::Send {Numpad0}
NumpadIns up::Send {NumpadIns}

NumpadAdd::Return
NumpadAdd up::Send {NumpadAdd}

NumpadDel::return
NumpadDel up:: Send {NumpadDel}
NumpadDot::return
NumpadDot up::Send {NumpadDot}

Numpad0 & Numpad1::discordOrStrawberry()
Numpad0 & Numpad2::launchOrSwitchFirefox()
Numpad0 & Numpad3::launchOrSwitchCode()
NumpadIns & NumpadEnd::discordOrStrawberry()
NumpadIns & NumpadDown::launchOrSwitchFirefox()
NumpadIns & NumpadPgdn::launchOrSwitchCode()
NumpadDot & Numpad1::ChangeLayer()
NumpadDel & NumpadEnd::ChangeLayer()
NumpadDot & Numpad2::ChangeBTD6Map()
NumpadDel & NumpadDown::ChangeBTD6Map()

Numpad0 & NumpadDiv::NumpadDiv
Numpad0 & NumpadMult::NumpadMult
Numpad0 & NumpadSub::NumpadSub
Numpad0 & CapsLock::CapsLock

; Youtube speed setting
Numpad0 & s::
    SetDefaultMouseSpeed, 4 ; Defaul is 2
    Send {Click 1789, 1051}
    MouseMove, 1714, 829
    ; MouseMove, 1585, 835
Return

auto_click := false
#MaxThreadsPerHotKey, 2 ; this only affects this keybinding, nice!
Numpad0 & a::	
    global auto_click
    auto_click := !auto_click
    if auto_click
        GuiTopLeft("Auto click is on")
    else
        GuiTopLeft("Auto click is off")
    while (auto_click) {
        Click, Left
        sleep, 34
    }
return


CapsLock::Esc 

; ; Layers
; Main
Numpad0 & Numpad7::
    current_layer := "Main"
    Gui, New, ToolWindow, 

    Gui, Font, S15, MesloLGS NF
    Gui, Add, Text, , % "Layer: "

    Gui, Font, S15 bold
    Gui, Add, Text, X+0, % current_layer

    Gui, -Caption +AlwaysOnTop
    Gui, Show, NoActivate AutoSize X1920 Y0,
    Sleep, 750
    Gui, Destroy
Return
NumpadIns & NumpadHome::
    current_layer := "Main"
    Gui, New, ToolWindow, 

    Gui, Font, S15, MesloLGS NF
    Gui, Add, Text, , % "Layer: "

    Gui, Font, S15 bold
    Gui, Add, Text, X+0, % current_layer

    Gui, -Caption +AlwaysOnTop
    Gui, Show, NoActivate AutoSize X1920 Y0,
    Sleep, 750
    Gui, Destroy
Return
; Cyanotype Daydream
Numpad0 & Numpad8::
    current_layer := "Cyanotype Daydream"
    Gui, New, ToolWindow, 

    Gui, Font, S15, MesloLGS NF
    Gui, Add, Text, , % "Layer: "

    Gui, Font, S15 bold
    Gui, Add, Text, X+0, % current_layer

    Gui, -Caption +AlwaysOnTop
    Gui, Show, NoActivate AutoSize X1920 Y0,
    Sleep, 750
    Gui, Destroy
Return
NumpadIns & NumpadUp::
    current_layer := "Cyanotype Daydream"
    Gui, New, ToolWindow, 

    Gui, Font, S15, MesloLGS NF
    Gui, Add, Text, , % "Layer: "

    Gui, Font, S15 bold
    Gui, Add, Text, X+0, % current_layer

    Gui, -Caption +AlwaysOnTop
    Gui, Show, NoActivate AutoSize X1920 Y0,
    Sleep, 750
    Gui, Destroy
Return
; BTD6
Numpad0 & Numpad4::
    current_layer := "BTD6"
    Gui, New, ToolWindow, 

    Gui, Font, S15, MesloLGS NF
    Gui, Add, Text, , % "Layer: "

    Gui, Font, S15 bold
    Gui, Add, Text, X+0, % current_layer

    Gui, -Caption +AlwaysOnTop
    Gui, Show, NoActivate AutoSize X1920 Y0,
    Sleep, 750
    Gui, Destroy
Return
NumpadIns & NumpadLeft::
    current_layer := "BTD6"
    Gui, New, ToolWindow, 

    Gui, Font, S15, MesloLGS NF
    Gui, Add, Text, , % "Layer: "

    Gui, Font, S15 bold
    Gui, Add, Text, X+0, % current_layer

    Gui, -Caption +AlwaysOnTop
    Gui, Show, NoActivate AutoSize X1920 Y0,
    Sleep, 750
    Gui, Destroy
Return

; Reload script
NumpadIns & NumpadPgup::
    GuiTopLeft("Reloading script...")
    Reload
Return
Numpad0 & Numpad9::
    GuiTopLeft("Reloading script...")
    Reload
Return

; Print cursor position
Numpad0 & /::
    MouseGetPos, x_position, y_position
    GuiTopLeft("The cursor is at`nx=" . x_position . ", y=" . y_position)
return
NumpadIns & /::
    MouseGetPos, x_position, y_position
    GuiTopLeft("The cursor is at`nx=" . x_position . ", y=" . y_position)
Return
; Copy cursor position to clipboard
NumpadIns & NumpadClear::
    ; MouseGetPos, x_position, y_position0
    ; TrayTip Copied to clipboard, %x_position%`, %y_position%, 2

    ; clipboard := x_position ", " y_position
    MouseGetPos, x_position, y_position
    ; TrayTip Copied to clipboard, %x_position%`, %y_position%, 02
    clipboard := x_position ", " y_position
    GuiTopLeft("Copied to clipboard:`n" . x_position . ", " . y_position)
Return
Numpad0 & Numpad5::
    MouseGetPos, x_position, y_position
    clipboard := x_position ", " y_position
    GuiTopLeft("Copied to clipboard:`n" . x_position . ", " . y_position)
Return
; Open Window spy
Numpad0 & .::run, "C:\Program Files\AutoHotkey\WindowSpy.ahk"
NumpadIns & .::run, "C:\Program Files\AutoHotkey\WindowSpy.ahk"

; https://www.reddit.com/r/AutoHotkey/comments/mgalh9/comment/gssc2af/?utm_source=share&utm_medium=web2x&context=3
#if (current_layer = "Rewrite")
    ifRewrite(key, x, y) {
        SetTitleMatchMode, RegEx

        if WinActive("^Rewrite*")
            clickAndReturn(x, y)
        else
            SendInput, {%key%}
    }
    ; https://www.autohotkey.com/boards/viewtopic.php?p=186138#p186138
    $a::ifRewrite("a", 1016, 1057)
    $s::ifRewrite("s", 1709, 931)
    $t::ifRewrite("t", 1707, 985)
    $l::ifRewrite("l", 1836, 934)
    $f::ifRewrite("f", 1165, 1065)
    $v::ifRewrite("v", 750, 1059)
    $r::ifRewrite("r", 750, 1059)
    $c::ifRewrite("c", 1439, 1064)
    $m::ifRewrite("m", 1706, 1040)
    $o::ifRewrite("o", 1842, 1037)
    $d::ifRewrite("d", 1297, 1050)
    $Space::
        SetTitleMatchMode, RegEx

        if WinActive("^Rewrite*")
            SendInput, {Enter Down}
        else
            SendInput, {Space Down}
    Return
    $Space up::
        SetTitleMatchMode, RegEx

        if WinActive("^Rewrite*")
            SendInput, {Enter Up}
        else
            SendInput, {Space Up}
    Return
#if
#if (current_layer = "Dead Omegalul Aegis")
    ifDeadEndAegis(new_key, original_key) {
        if WinActive("ahk_exe DeadEndAegis.exe")
            SendInput, {%new_key%}
        else
            SendInput, {%original_key%}
    }
    $f::ifDeadEndAegis("LShift", "f")
    $c::ifDeadEndAegis("Space", "c")
    $PgUp::ifDeadEndAegis("Up", "PgUp")
    $PgDn::ifDeadEndAegis("Down", "PgDown")
    $o::ifDeadEndAegis("c", "o")
    $Space::ifDeadEndAegis("Enter", "Space")
    $t::ifDeadEndAegis("o", "t")
    $Esc::
        if WinActive("ahk_exe DeadEndAegis.exe")
            Click, Right
        else
            SendInput, {Esc}
    Return
#if
#if (current_layer = "Sugar * Style")
    $Space::
        if WinActive("ahk_exe SugarStyle.exe")
            SendInput, {Enter}
        else
            SendInput, {Space}             
    Return
    $r::
        if WinActive("ahk_exe SugarStyle.exe")
            clickAndReturn(1211, 1061)
        else
            SendInput, {r}      
    Return
    $v::
        if WinActive("ahk_exe SugarStyle.exe")
            clickAndReturn(1211, 1061)
        else
            SendInput, {v}      
    Return
    $Esc::
        if WinActive("ahk_exe SugarStyle.exe")
            Click, Right
        else
            SendInput, {Esc}
    Return

#if
#if (current_layer = "Kinkoi")
    IfKinkoiKey(new_key, original_key) {
        if WinActive("ahk_exe Kinkoi.exe")
            SendInput, {%new_key%}
        else
            SendInput, {%original_key%}
    }
    IfKinkoiClick(key, x, y) {
        if WinActive("ahk_exe Kinkoi.exe")
            clickAndReturn(x, y)
        else
            SendInput, {%key%}
    }
    $a::IfKinkoiClick("a", 1331, 1054)
    $s::IfKinkoiClick("s", 1081, 1057)
    $l::IfKinkoiClick("l", 1150, 1052)
    $f::IfKinkoiClick("f", 1273, 1059)
    $v::IfKinkoiClick("v", 1620, 1054)
    $r::IfKinkoiClick("r", 1692, 1054)
    $c::IfKinkoiClick("c", 1780, 1056)
    $b::IfKinkoiClick("b", 1656, 1057)
    $m::
        if WinActive("ahk_exe Kinkoi.exe") {
            SetDefaultMouseSpeed, 0 ; Defaul is 2
            Send {Click 1503, 1056}
            SetDefaultMouseSpeed, 8 ; Defaul is 2
            Send {Click 1675, 139}
            Send {Click 229, 322}
            Send {Click, Right}
        } else {
            SendInput, {m}
        }
    Return
    $o::IfKinkoiClick("o", 1503, 1056)
    $t::
        if WinActive("ahk_exe Kinkoi.exe") {
            SetDefaultMouseSpeed, 0 ; Defaul is 2
            Send {Click 1503, 1056}
            SetDefaultMouseSpeed, 4 ; Defaul is 2
            sleep 0.1
            Send {Click, 1632, 1031}
            ; ; Moves mouse to center of screen. I don't like it tho lol
            ; CoordMode, Mouse, Screen
            ; MouseMove, A_ScreenWidth / 2, A_ScreenHeight / 2
        } else {
            SendInput, {t}
        }
    Return
    $Space::IfKinkoiKey("Enter", "Space")
    $Up::IfKinkoiKey("WheelUp", "Up")
    $Down::IfKinkoiKey("WheelDown", "Down")
    $PgUp::IfKinkoiKey("WheelUp", "PgUp")
    $PgDn::IfKinkoiKey("WheelDown", "PgDn")
#if
#if (current_layer = "Hatsukoi")
    IfHatsukoiKey(new_key, original_key) {
        if WinActive("Hatsukoi 1/1")
            SendInput, {%new_key%}
        else
            SendInput, {%original_key%}
    }
    IfHatsukoiClick(key, x, y) {
        if WinActive("Hatsukoi 1/1")
            clickAndReturn(x, y)
        else
            SendInput, {%key%}
    }
    $s::IfHatsukoiClick("s", 713, 1048)
    $l::IfHatsukoiClick("l", 803, 1046)
    $f::IfHatsukoiClick("f", 906, 1051)
    $a::IfHatsukoiClick("a", 989, 1050)
    $v::IfHatsukoiClick("v", 1577, 1011)
    $r::IfHatsukoiClick("r", 1577, 1011)
    $c::IfHatsukoiClick("c", 1523, 1049)
    $m::
        if WinActive("Hatsukoi 1/1") {
            SetDefaultMouseSpeed, 4 ; Defaul is 2
            Send {Click 1320, 1053}
            Send {Click 809, 168}
            Send {Click 877, 353}
        } else {
            SendInput, {m}
        }
    Return
    $o::IfHatsukoiClick("o", 1320, 1053)
    $t::
        if WinActive("Hatsukoi 1/1") {
            SetDefaultMouseSpeed, 4 ; Defaul is 2
            Send {Click 1320, 1053}
            Send {Click 1600, 979}
            CoordMode, Mouse, Screen
            MouseMove, A_ScreenWidth / 2, A_ScreenHeight / 2
        } else {
            SendInput, {t}
        }
    Return
    $Space::IfHatsukoiKey("Enter", "Space")
    $Up::IfHatsukoiKey("WheelUp", "Up")
    $Down::IfHatsukoiKey("WheelDown", "Down")
    $PgUp::IfHatsukoiKey("WheelUp", "PgUp")
    $PgDn::IfHatsukoiKey("WheelDown", "PgDn")
#if
#if (current_layer = "Hoshi Ori")
    IfHoshiOriKey(new_key, original_key) {
        if WinActive("Hoshi Ori Yume Mirai")
            SendInput, {%new_key%}
        else
            SendInput, {%original_key%}
    }
    IfHoshiOriClick(key, x, y) {
        if WinActive("Hoshi Ori Yume Mirai")
            clickAndReturn(x, y)
        else
            SendInput, {%key%}
    }
    $s::IfHoshiOriClick("s", 714, 1054)
    $l::IfHoshiOriClick("l", 820, 1049)
    $f::IfHoshiOriClick("f", 912, 1049)
    $a::IfHoshiOriClick("a", 1001, 1046)
    $v::IfHoshiOriClick("v", 1523, 1002)
    $r::IfHoshiOriClick("r", 1523, 1002)
    $c::IfHoshiOriClick("c", 1476, 1051)
    $m::
        if WinActive("Hoshi Ori Yume Mirai") {
            SetDefaultMouseSpeed, 8 ; Defaul is 2
            Send {Click 1307, 1049}
            Send {Click 775, 116}
            Send {Click 794, 280}
        } else {
            SendInput, {m}
        }
    Return
    $o::IfHoshiOriClick("o", 1307, 1049)
    $t::
        if WinActive("Hoshi Ori Yume Mirai") {
            SetDefaultMouseSpeed, 8 ; Defaul is 2
            Send {Click 1307, 1049}
            Send {Click 1484, 913}
            CoordMode, Mouse, Screen
            MouseMove, A_ScreenWidth / 2, A_ScreenHeight / 2
        } else {
            SendInput, {t}
        }
    Return
    $Space::IfHoshiOriKey("Enter", "Space")
    $Up::IfHoshiOriKey("WheelUp", "Up")
    $Down::IfHoshiOriKey("WheelDown", "Down")
    $PgUp::IfHoshiOriKey("WheelUp", "PgUp")
    $PgDn::IfHoshiOriKey("WheelDown", "PgDn")
#if
#if (current_layer = "Cafe Stella")
    IfCafeStellaKey(new_key, original_key) {
        if WinActive("ahk_exe CafeStella.exe")
            SendInput, {%new_key%}
        else
            SendInput, {%original_key%}
    }
    $m::
        if WinActive("ahk_exe CafeStella.exe") {
            MouseGetPos, x_original, y_original 
            SendInput, {m}
            SetDefaultMouseSpeed, 0 ; Default is 2
            Sleep, 10
            Send {Click 604, 567}
            SendInput, {m}
            CoordMode, Mouse, Screen
            MouseMove, x_original, y_original
        } else {
            SendInput, {m}
        }
    Return
    $t::IfCafeStellaKey("y", "t")
    $c::IfCafeStellaKey("0", "c")
    $j::IfCafeStellaKey("", "j")
#if
#if (current_layer = "Cyanotype Daydream") ; FRICK this isn't gonna work out...
    IfCyanotypeDaydreamKey(new_key, original_key) {
        if WinActive("Cyanotype Daydream")
            SendInput, {%new_key%}
        else
            SendInput, {%original_key%}
    }
    IfCyanotypeDaydreamClick(key, x, y) {
        if WinActive("Cyanotype Daydream")
            clickAndReturn(x, y)
        else
            SendInput, {%key%}
    }
    $m:: ; doesn't work that well cuz it's not a toggle
        if WinActive("Cyanotype Daydream") {
            SetDefaultMouseSpeed, 0 ; Default is 2
            Send {Click 1887, 1061}
            Sleep, 1600
            Send {Click 1706, 68}
            Sleep, 500
            Send {Click 76, 275}
        } else {
            SendInput, {m}
        }
    Return
    $a::IfCyanotypeDaydreamClick("a", 1455, 1065)
    $s::IfCyanotypeDaydreamClick("s", 1585, 1058)
    $l::IfCyanotypeDaydreamClick("l", 1624, 1059)
    $c::IfCyanotypeDaydreamClick("c", 1904, 884)
    $o::IfCyanotypeDaydreamClick("o", 1887, 1061)
    $f::IfCyanotypeDaydreamClick("f", 1498, 1065)

    $t::
        if WinActive("Cyanotype Daydream") {
            SetDefaultMouseSpeed, 0 ; Default is 2
            Send, {Click 0, 0}
            Sleep, 20
            Send, {Click 58, 35}
            Sleep, 20
            Send, {Enter}
        } else {
            SendInput, {t}
        }
    Return

    $v::IfCyanotypeDaydreamClick("v", 485, 868)
    $r::IfCyanotypeDaydreamClick("r", 485, 868)
    $y::IfCyanotypeDaydreamClick("y", 1841, 1066)
    $Space::IfCyanotypeDaydreamKey("Enter", "Space")
#if
#if (current_layer = "BTD6")
    NumpadUp::MouseMove, 0, -1 , 0, R
    NumpadDown::MouseMove, 0, 1 , 0, R
    NumpadLeft::MouseMove, -1, 0 , 0, R
    NumpadRight::MouseMove, 1, 0 , 0, R
    LShift & NumpadUp::
        If GetKeyState("LControl", "P")
            MouseMove, 0, -15 , 0, R
        Else
            MouseMove, 0, -5 , 0, R        
    Return
    LShift & NumpadDown::
        If GetKeyState("LControl", "P")
            MouseMove, 0, 15 , 0, R
        Else
            MouseMove, 0, 5 , 0, R        
    Return
    LShift & NumpadLeft::
        If GetKeyState("LControl", "P")
            MouseMove, -15, 0 , 0, R
        Else
            MouseMove, -5, 0 , 0, R
    Return
    LShift & NumpadRight::
        If GetKeyState("LControl", "P")
            MouseMove, 15, 0 , 0, R
        Else
            MouseMove, 5, 0 , 0, R       
    Return
    
    ; distance of a farm
    LControl & NumpadUp::
        If GetKeyState("Lalt", "P")
            MouseMove, 0, -15 , 0, R
        Else
            MouseMove, 0, -141 , 0, R        
    Return
    LControl & NumpadDown::
        If GetKeyState("Lalt", "P")
            MouseMove, 0, 15 , 0, R
        Else
            MouseMove, 0, 141 , 0, R        
    Return
    LControl & NumpadLeft::
        If GetKeyState("Lalt", "P")
            MouseMove, -15, 0 , 0, R
        Else
            MouseMove, -162, 0 , 0, R
    Return
    LControl & NumpadRight::
        If GetKeyState("Lalt", "P")
            MouseMove, 15, 0 , 0, R
        Else
            MouseMove, 162, 0 , 0, R       
    Return

    NumpadClear:: Send {Click}

    ; Numpad0 & /::
    ;     MouseGetPos, x_position, y_position
    ;     GuiTopLeft("Copied to clipboard:`n" . x_position . ", " . y_position)
    ;     ; TrayTip Copied to clipboard, %x_position%`, %y_position%, 02
    ;     clipboard := x_position ", " y_position
    ; Return


    ; Numpad0 & Numpad5::
    ;     ; MouseGetPos, x_position, y_position0
    ;     ; TrayTip Copied to clipboard, %x_position%`, %y_position%, 2

    ;     ; clipboard := x_position ", " y_position
    ;     MouseGetPos, x_position, y_position
    ;     ; TrayTip Copied to clipboard, %x_position%`, %y_position%, 02
    ;     clipboard := x_position ", " y_position
    ;     GuiTopLeft("Copied to clipboard:`n" . x_position . ", " . y_position)
    ; Return

    PlaceTower(tower, x_position, y_position) {
        global btd6_key_bindings
        global tower_click

        key_to_press := btd6_key_bindings[tower]

        CoordMode, Mouse, Screen
        MouseMove, x_position, y_position, 0
        SendInput, {%key_to_press%}

        if (tower_click) {
            Sleep, 35
            SendInput, {Click}
        }
    }
    PlaceTowerAndUpgrade(tower, x_position, y_position, top_upgrade, middle_upgrade, bottom_upgrade) {
        global btd6_key_bindings
        global tower_click
        global tower_upgrade

        key_to_press := btd6_key_bindings[tower]

        CoordMode, Mouse, Screen
        MouseMove, x_position, y_position, 0
        SendInput, {%key_to_press%}

        if (tower_click) {
            Sleep, 65
            SendInput, {Click}

            if (tower_upgrade) {
                Sleep, 65
                SendInput, {Click}
                Sleep, 65

                Loop %top_upgrade% {
                    Sleep, 65
                    SendInput, {,}
                }
                Loop %middle_upgrade% {
                    Sleep, 65
                    SendInput, {.}
                }
                Loop %bottom_upgrade% {
                    Sleep, 65
                    SendInput, {/}
                }
            }
        }
    }

    NumpadIns & F1::
        global tower_click

        tower_click := !tower_click
        if tower_click
            GuiTopLeft("Tower click is on")
        else
            GuiTopLeft("Tower click is off")
    Return
    NumpadIns & F2::
        global tower_upgrade

        tower_upgrade := !tower_upgrade
        if tower_upgrade
            GuiTopLeft("Tower upgrade is on")
        else
            GuiTopLeft("Tower upgrade is off")
    Return

    ; auto cash drop
    cash_drop := false
    #MaxThreadsPerHotKey, 2 ; this only affects this keybinding, nice!
    NumpadIns & F3::
    global cash_drop
        cash_drop := !cash_drop
        if cash_drop
            GuiTopLeft("Cash drop spam is on")
        else
            GuiTopLeft("Cash drop spam is off")
        while (cash_drop) {
            Send {Click, 1724, 408, Down}
            CoordMode, Mouse, Screen
            MouseMove, 1600, 410
            Send {Click, Up}
            sleep, 34
        }
    Return

    ; Maps
    global btd6_map
    #if (btd6_map = "Chutes") 
        NumpadIns & q::PlaceTower("dart", 882, 815)
        NumpadIns & w::PlaceTower("sniper", 303, 197)
        NumpadIns & e::PlaceTower("dart", 783, 816)
        NumpadIns & r::PlaceTower("dart", 811, 524)
        NumpadIns & t::PlaceTower("dart", 872, 476)
        NumpadIns & y::PlaceTower("hero", 836, 619)
        NumpadIns & u::PlaceTower("sub", 992, 535)
        NumpadIns & i::PlaceTower("alch", 1233, 511)
        NumpadIns & o::PlaceTower("village", 897, 553)
        NumpadIns & p::PlaceTower("village", 646, 515)
        NumpadIns & a::PlaceTower("spike", 810, 438)
        NumpadIns & s::PlaceTower("alch", 816, 372)
        NumpadIns & d::PlaceTower("glue", 734, 414)
        NumpadIns & f::PlaceTower("dart", 935, 700)
        NumpadIns & g::PlaceTower("dart", 984, 663)
        NumpadIns & h::PlaceTower("dart", 733, 701)
        NumpadIns & j::PlaceTower("dart", 937, 481)
        NumpadIns & k::PlaceTower("dart", 732, 543)
        NumpadIns & l::PlaceTower("dart", 757, 491)
        NumpadIns & z::PlaceTower("dart", 684, 664)
        NumpadIns & x::PlaceTower("dart", 997, 718)
        NumpadIns & c::PlaceTower("tack", 833, 778)
        NumpadIns & v::PlaceTower("alch", 786, 576)
        NumpadIns & b::PlaceTower("alch", 671, 719)
    #if
    #if (btd6_map = "Bazaar")
        NumpadIns & q::PlaceTower("engineer", 1004, 541)
        NumpadIns & w::PlaceTower("dart", 1283, 532)
        NumpadIns & e::PlaceTower("sniper", 480, 545)
        NumpadIns & r::PlaceTower("hero", 1379, 541)
        NumpadIns & t::PlaceTower("village", 201, 539)
        NumpadIns & y::PlaceTower("bomb", 299, 541)
        NumpadIns & u::PlaceTower("alch", 180, 617)
        NumpadIns & i::PlaceTower("bomb", 250, 612)
        NumpadIns & o::PlaceTower("village", 1475, 555)
        NumpadIns & p::PlaceTower("bomb", 1422, 484)
        NumpadIns & a::PlaceTower("bomb", 1422, 418)
        NumpadIns & s::PlaceTower("alch", 1495, 477)
        NumpadIns & d::PlaceTower("wizard", 250, 466)
        NumpadIns & f::PlaceTower("wizard", 1422, 626)
        NumpadIns & g::PlaceTower("ninja", 189, 353)
        NumpadIns & h::PlaceTower("glue", 1491, 638)
        NumpadIns & j::PlaceTower("ice", 415, 545)
        NumpadIns & k::PlaceTower("spike", 1426, 697)
    #if
    #if (btd6_map = "Peninsula") 
        NumpadIns & q::PlaceTower("dart", 1073, 788)
        NumpadIns & w::PlaceTower("sub", 1228, 648)_
        NumpadIns & e::PlaceTower("dart", 1123, 744)
        NumpadIns & r::PlaceTower("sniper", 898, 327)
        NumpadIns & t::PlaceTower("hero", 1237, 582)
        NumpadIns & y::PlaceTower("bucc", 1252, 513)
        NumpadIns & u::PlaceTower("sub", 341, 223)
        NumpadIns & i::PlaceTower("spike", 1437, 158)
        NumpadIns & o::PlaceTower("alch", 1524, 235)
        NumpadIns & p::PlaceTower("druid", 1142, 803) ; dont need, lol
        NumpadIns & a::PlaceTower("ice", 1271, 373)
        NumpadIns & s::PlaceTower("village", 1411, 412)
        NumpadIns & d::PlaceTower("tack", 1152, 411)
        NumpadIns & f::PlaceTower("boomer", 1337, 352)
        NumpadIns & g::PlaceTower("boomer", 1330, 286)
        NumpadIns & h::PlaceTower("boomer", 1402, 306)
        NumpadIns & j::PlaceTower("glue", 1310, 418)
        NumpadIns & k::PlaceTower("glue", 1326, 529)
        
        NumpadIns & z::PlaceTower("spike", 1448, 233)
        NumpadIns & x::PlaceTower("alch", 1512, 171)
        NumpadIns & c::PlaceTower("ice", 1461, 479)
        ; NumpadIns & f::PlaceTower("glue", 1326, 529)
        ; NumpadIns & l::PlaceTower("glue", 1332, 471)
        ; NumpadIns & z::PlaceTower("glue", 1387, 501)
        ; NumpadIns & x::PlaceTower("engineer", 1332, 527)
        ; NumpadIns & c::PlaceTower("engineer", 1395, 496)
        ; NumpadIns & n::PlaceTower("glue", 1310, 418)
        ; NumpadIns & m::PlaceTower("glue", 1310, 418)
    #if
    #if (btd6_map = "Underground") 
        NumpadIns & q::PlaceTower("druid", 602, 405)
        NumpadIns & w::PlaceTower("dart", 508, 535)_
        NumpadIns & e::PlaceTower("engineer", 637, 528)
        NumpadIns & r::PlaceTower("hero", 690, 481)
        NumpadIns & t::PlaceTower("sniper", 493, 480)
        NumpadIns & y::PlaceTower("village", 943, 568)
        NumpadIns & u::PlaceTower("bomb", 1026, 524)
        NumpadIns & i::PlaceTower("alch", 1067, 422)
        NumpadIns & o::PlaceTower("bomb", 970, 479)
        NumpadIns & p::PlaceTower("mortar", 1187, 643)
        NumpadIns & a::PlaceTower("tack", 831, 531)
        NumpadIns & s::PlaceTower("alch", 792, 741) ; dont need, lol
        NumpadIns & d::PlaceTower("super", 1170, 529)
        NumpadIns & f::PlaceTower("sniper", 751, 512) ; or ninja
        NumpadIns & g::PlaceTower("engineer", 758, 451)
        ; NumpadIns & u::PlaceTower("village", 955, 567)
        ; NumpadIns & t::PlaceTower("ninja",1032, 523 )
        ; NumpadIns & y::PlaceTower("bomb", 978, 483)
        ; NumpadIns & h::PlaceTower("super", 1043, 674)
        NumpadIns & n::PlaceTower("alch", 956, 783)
    #if
    #if (btd6_map = "Cargo")
        NumpadIns & q::PlaceTower("sub",  152, 163)
        NumpadIns & w::PlaceTower("dart", 1261, 360)
        NumpadIns & e::PlaceTower("engineer", 1167, 360)
        NumpadIns & r::PlaceTower("hero", 918, 487)
        NumpadIns & t::PlaceTower("sniper", 749, 250)
        NumpadIns & y::PlaceTower("alch", 372, 251)
        NumpadIns & u::PlaceTower("village", 711, 547)
        NumpadIns & i::PlaceTower("village", 719, 650)
        NumpadIns & o::PlaceTower("bomb", 598, 481)
        NumpadIns & p::PlaceTower("alch", 527, 477)
        NumpadIns & a::PlaceTower("bomb", 613, 546)
        NumpadIns & s::PlaceTower("ice", 953, 540)
        NumpadIns & d::PlaceTower("dart", 848, 482)
        NumpadIns & f::PlaceTower("glue", 796, 516)
        NumpadIns & g::PlaceTower("dart", 876, 536)
        NumpadIns & h::PlaceTower("dart", 883, 592)
        NumpadIns & j::PlaceTower("dart", 948, 596)
        NumpadIns & k::PlaceTower("dart", 823, 569)
        NumpadIns & l::PlaceTower("dart", 940, 652)
        NumpadIns & z::PlaceTower("dart", 876, 664)
        NumpadIns & x::PlaceTower("dart", 874, 721)
        NumpadIns & c::PlaceTower("dart", 805, 680)
        NumpadIns & v::PlaceTower("dart", 818, 625)
        NumpadIns & b::PlaceTower("mortar", 558, 728)
    #if
    #if (btd6_map = "Cornfield") ; this strat sucls
        NumpadIns & q::PlaceTower("dart", 749, 646) ;
        NumpadIns & w::PlaceTower("tack", 751, 473)
        NumpadIns & e::PlaceTower("bomb", 822, 477)
        NumpadIns & r::PlaceTower("bomb", 898, 477)
        NumpadIns & t::PlaceTower("hero", 753, 585)
        NumpadIns & y::PlaceTower("alch", 859, 529)
        NumpadIns & u::PlaceTower("village", 846, 671)
        NumpadIns & i::PlaceTower("ice", 773, 526)
        NumpadIns & a::PlaceTower("spike", 927, 751) ; !
        ; NumpadIns & u::PlaceTower("village", 890, 627)

        ; NumpadIns & i::PlaceTower("dart", 848, 482)
        NumpadIns & o::PlaceTower("dart", 814, 646)
        NumpadIns & p::PlaceTower("engineer", 820, 642)
        NumpadIns & s::PlaceTower("druid", 829, 588) ; dont need, lol
        NumpadIns & d::PlaceTower("dart", 823, 569) ; !
        NumpadIns & f::PlaceTower("dart", 940, 652) ; or ninja
        NumpadIns & g::PlaceTower("dart", 876, 664)
        NumpadIns & h::PlaceTower("dart", 874, 721)
        NumpadIns & j::PlaceTower("dart", 805, 680)
        NumpadIns & k::PlaceTower("dart", 818, 625)
        NumpadIns & l::PlaceTower("dart", 818, 625)
        ; 850, 570
        
        
        NumpadIns & x::PlaceTower("dart", 997, 718)
        NumpadIns & c::PlaceTower("tack", 833, 778)
        NumpadIns & v::PlaceTower("alch", 786, 576)
        NumpadIns & b::PlaceTower("alch", 671, 719)
        ; 1218, 249
        
    #if
    #if (btd6_map = "Flooded Valley") ; this strat sucls
        NumpadIns & q::PlaceTower("sub", 1087, 881) ;
        NumpadIns & e::PlaceTower("sub", 990, 159)
        NumpadIns & t::PlaceTower("hero", 753, 625)
        NumpadIns & w::PlaceTower("sub", 995, 769)
        NumpadIns & r::PlaceTower("sniper", 593, 773)
        NumpadIns & y::PlaceTower("bucc", 1035, 708)
        NumpadIns & u::PlaceTower("village", 550, 591)
        NumpadIns & i::PlaceTower("wizard", 707, 677)
        NumpadIns & a::PlaceTower("wizard", 667, 733) ; !

        ; NumpadIns & u::PlaceTower("village", 890, 627)

        ; NumpadIns & i::PlaceTower("dart", 848, 482)
        NumpadIns & o::PlaceTower("heli", 337, 586)
        NumpadIns & p::PlaceTower("wizard", 756, 559)
        NumpadIns & s::PlaceTower("druid", 829, 588) ; dont need, lol
        NumpadIns & d::PlaceTower("dart", 823, 569) ; !
        NumpadIns & f::PlaceTower("dart", 940, 652) ; or ninja
        NumpadIns & g::PlaceTower("dart", 876, 664)
        NumpadIns & h::PlaceTower("dart", 874, 721)
        NumpadIns & j::PlaceTower("dart", 805, 680)
        NumpadIns & k::PlaceTower("dart", 818, 625)
        NumpadIns & l::PlaceTower("dart", 818, 625)
        ; 850, 570
        
        
        NumpadIns & x::PlaceTower("hero", 764, 608)
        NumpadIns & c::PlaceTower("sub", 995, 767)
        NumpadIns & v::PlaceTower("village", 701, 673)
        NumpadIns & b::PlaceTower("bucc", 1036, 706)
        ; 1218, 249
        
    #if
    #if (btd6_map = "X Factor")
        NumpadIns & q::PlaceTowerAndUpgrade("dart", 1358, 267, 0,0,0) ;
        NumpadIns & w::PlaceTowerAndUpgrade("dart", 353, 203, 0,0,0)
        NumpadIns & e::PlaceTowerAndUpgrade("sniper", 158, 547, 0,5,2)
        NumpadIns & r::PlaceTowerAndUpgrade("sniper", 232, 687, 4,2,0)
        NumpadIns & t::PlaceTowerAndUpgrade("hero", 570, 561, 20,0,0)
        NumpadIns & y::PlaceTowerAndUpgrade("ninja", 1103, 531, 4,0,2)
        NumpadIns & u::PlaceTowerAndUpgrade("alch", 1168, 526, 4,2,0)

        NumpadIns & i::PlaceTowerAndUpgrade("village", 374, 481, 4,0,2) ; !
        NumpadIns & o::PlaceTowerAndUpgrade("village", 348, 582, 0,2,2) ; or ninja
        NumpadIns & p::PlaceTowerAndUpgrade("bomb", 528, 506, 0,2,4)
        NumpadIns & a::PlaceTowerAndUpgrade("alch", 473, 468, 4,0,1)
        NumpadIns & s::PlaceTowerAndUpgrade("bomb", 467, 545, 0,2,4) ; !
        NumpadIns & d::PlaceTowerAndUpgrade("bomb", 509, 600, 0,2,4)
        NumpadIns & f::PlaceTowerAndUpgrade("bomb", 436, 618, 0,2,4)
        NumpadIns & g::PlaceTowerAndUpgrade("alch", 485, 662, 4,0,1) ; dont need, lol
        NumpadIns & h::PlaceTowerAndUpgrade("alch", 154, 604, 4,0,1)
        NumpadIns & j::PlaceTowerAndUpgrade("sniper", 219, 576, 0,3,2)
        NumpadIns & k::PlaceTowerAndUpgrade("sniper", 238, 630, 0,3,2)
        NumpadIns & l::PlaceTowerAndUpgrade("alch", 176, 658, 4,0,1)

        NumpadIns & z::PlaceTowerAndUpgrade("ninja", 260, 391, 0,4,0) ; original spot
        ; NumpadIns & z::PlaceTowerAndUpgrade("ninja", 286, 504, 0,4,0) ; space for heli
        NumpadIns & x::PlaceTowerAndUpgrade("glue", 324, 378, 2,5,0)
        NumpadIns & c::PlaceTowerAndUpgrade("ice", 362, 727, 4,1,0)
        NumpadIns & v::PlaceTowerAndUpgrade("glue", 1281, 192, 0,2,3)
        NumpadIns & b::PlaceTowerAndUpgrade("boomer", 1256, 267, 2,0,4)
        NumpadIns & n::PlaceTowerAndUpgrade("boomer", 1160, 197, 2,0,4)
        NumpadIns & m::PlaceTowerAndUpgrade("tack", 454, 718, 2,0,4)
        NumpadDel & q::PlaceTowerAndUpgrade("tack", 314, 785, 2,0,4) 
        NumpadDel & w::PlaceTowerAndUpgrade("heli", 218, 410, 2,0,4) 

        NumpadDel & i::PlaceTowerAndUpgrade("dart", 537, 507, 0,0,0)
        NumpadDel & o::PlaceTowerAndUpgrade("dart", 516, 600, 0,0,0)
        NumpadDel & p::PlaceTowerAndUpgrade("dart", 488, 463, 0,0,0)
        NumpadDel & a::PlaceTowerAndUpgrade("dart", 491, 548, 0,0,0)
        NumpadDel & s::PlaceTowerAndUpgrade("dart", 487, 651, 0,0,0)
        NumpadDel & d::PlaceTowerAndUpgrade("dart", 451, 593, 0,0,0)
        NumpadDel & f::PlaceTowerAndUpgrade("dart", 421, 643, 0,0,0)
        NumpadDel & g::PlaceTowerAndUpgrade("dart", 446, 507, 0,0,0)
        NumpadDel & h::PlaceTowerAndUpgrade("dart", 424, 454, 0,0,0)
        NumpadDel & j::PlaceTowerAndUpgrade("dart", 399, 546, 0,0,0)
        NumpadDel & k::PlaceTowerAndUpgrade("village", 329, 598, 0,0,0)
        NumpadDel & l::PlaceTowerAndUpgrade("village", 328, 495, 0,0,0)
        NumpadDel & z::PlaceTowerAndUpgrade("spike", 459, 712, 0,0,0)
        NumpadDel & x::PlaceTowerAndUpgrade("bomb", 235, 469, 0,0,0)
        NumpadDel & c::PlaceTowerAndUpgrade("bomb", 232, 607, 0,0,0)
        NumpadDel & v::PlaceTowerAndUpgrade("alch", 142, 669, 0,0,0)
        NumpadDel & b::PlaceTowerAndUpgrade("", 0,0, 0,0,0)
        NumpadDel & n::PlaceTowerAndUpgrade("", 0,0, 0,0,0)
        NumpadDel & m::PlaceTowerAndUpgrade("", 0,0, 0,0,0)
        ; 67 camo
        ; 218, 410
    #if
    #if (btd6_map = "High Finance")
        NumpadIns & q::PlaceTower("sub", 864, 479)
        NumpadIns & w::PlaceTower("dart", 970, 665)
        NumpadIns & e::PlaceTower("dart", 970, 475)
        NumpadIns & r::PlaceTower("hero", 702, 704)
        NumpadIns & t::PlaceTower("bucc", 745, 644)
        NumpadIns & y::PlaceTower("spike", 960, 406)
        NumpadIns & u::PlaceTower("village", 719, 423)
        NumpadIns & i::PlaceTower("alch", 885, 415)
        NumpadIns & o::PlaceTower("dart", 645, 557)
        NumpadIns & p::PlaceTower("dart", 735, 488)
        NumpadIns & a::PlaceTower("alch", 518, 353)
        NumpadIns & s::PlaceTower("glue", 814, 218)
        NumpadIns & d::PlaceTower("ninja", 809, 405)
    #if
    #if (btd6_map = "Adora's Temple")
        NumpadIns & q::PlaceTower("dart", 873, 869)
        NumpadIns & w::PlaceTower("sub", 1096, 183)
        NumpadIns & e::PlaceTower("hero", 769, 336)
        NumpadIns & r::PlaceTower("ninja", 897, 447)
        NumpadIns & t::PlaceTower("village", 774, 560)
        NumpadIns & y::PlaceTower("alch", 1033, 554)
        NumpadIns & u::PlaceTower("druid", 769, 451)
        NumpadIns & i::PlaceTower("alch", 560, 487)
        NumpadIns & o::PlaceTower("glue", 58, 25)
        NumpadIns & p::PlaceTower("tack", 618, 713)
        NumpadIns & a::PlaceTower("tack", 664, 753)
    #if
    #if (btd6_map = "Pat's Pond") ; nvm i don't wanna do this map
        NumpadIns & q::PlaceTower("sub", 1370, 442)
        NumpadIns & w::PlaceTower("dart", 1470, 605)
        NumpadIns & e::PlaceTower("sub", 345, 674)
        NumpadIns & r::PlaceTower("hero", 69, 482)
        NumpadIns & t::PlaceTower("", 0,0)
        NumpadIns & y::PlaceTower("", 0,0)
        NumpadIns & u::PlaceTower("", 0,0)
        NumpadIns & i::PlaceTower("", 0,0)
        NumpadIns & o::PlaceTower("", 0,0)
        NumpadIns & p::PlaceTower("", 0,0)
        NumpadIns & a::PlaceTower("", 0,0)
        NumpadIns & s::PlaceTower("", 0,0)
        NumpadIns & d::PlaceTower("", 0,0)
        NumpadIns & f::PlaceTower("", 0,0)
        NumpadIns & g::PlaceTower("", 0,0)
        NumpadIns & h::PlaceTower("", 0,0)
        NumpadIns & j::PlaceTower("", 0,0)
        NumpadIns & k::PlaceTower("", 0,0)
        NumpadIns & l::PlaceTower("", 0,0)
        NumpadIns & z::PlaceTower("", 0,0)
        NumpadIns & x::PlaceTower("", 0,0)
        NumpadIns & c::PlaceTower("", 0,0)
        NumpadIns & v::PlaceTower("", 0,0)
        NumpadIns & b::PlaceTower("", 0,0)
    #if
    #if (btd6_map = "Dark Castle") ; dead after version 31. pat is bigger now
        NumpadIns & q::PlaceTower("sub",  1090, 709)
        NumpadIns & w::PlaceTower("dart", 812, 657)
        NumpadIns & e::PlaceTower("dart", 747, 656)
        NumpadIns & r::PlaceTower("dart", 713, 704)
        NumpadIns & t::PlaceTower("hero", 878, 679)
        NumpadIns & y::PlaceTower("dart", 781, 763)
        NumpadIns & u::PlaceTower("alch", 979, 721)
        NumpadIns & i::PlaceTower("village", 947, 806)
        NumpadIns & o::PlaceTower("bomb", 951, 661)
        NumpadIns & p::PlaceTower("village", 831, 830)
        NumpadIns & a::PlaceTower("bomb", 1025, 675)
        NumpadIns & s::PlaceTower("dart", 778, 706)
        NumpadIns & d::PlaceTower("dart", 836, 732)
        NumpadIns & f::PlaceTower("dart", 716, 761)
        NumpadIns & g::PlaceTower("dart", 741, 813)
        NumpadIns & h::PlaceTower("dart", 901, 737)
        NumpadIns & j::PlaceTower("dart", 1029, 757)
        NumpadIns & k::PlaceTower("glue", 1029, 943)

        NumpadIns & z::PlaceTower("spike", 1575, 559)
        NumpadIns & x::PlaceTower("alch", 1612, 617)
    #if
    #if (btd6_map = "Rake")
        NumpadIns & q::PlaceTower("sub", 963, 426)
        NumpadIns & w::PlaceTower("dart", 1080, 364)
        NumpadIns & e::PlaceTower("hero", 1068, 457)
        NumpadIns & r::PlaceTower("sub", 868, 405)
        NumpadIns & t::PlaceTower("village", 899, 627)
        NumpadIns & y::PlaceTower("spike", 974, 841)
        NumpadIns & u::PlaceTower("alch", 899, 851)
        NumpadIns & i::PlaceTower("dartling", 753, 571)
        NumpadIns & o::PlaceTower("alch", 650, 567)
        NumpadIns & p::PlaceTower("glue", 1085, 568)
        NumpadIns & a::PlaceTower("ice", 1079, 648)
    #if
    #if (btd6_map = "Encrypted")
        NumpadIns & q::PlaceTower("dart", 820, 378) ; strong
        NumpadIns & w::PlaceTower("dart", 272, 880)
        NumpadIns & e::PlaceTower("dart", 1398, 880)
        NumpadIns & r::PlaceTower("hero", 498, 389)
        NumpadIns & t::PlaceTower("wizard", 721, 285)
        NumpadIns & y::PlaceTower("village", 824, 409)
        NumpadIns & u::PlaceTower("engineer", 951, 285)
        NumpadIns & i::PlaceTower("dart", 768, 472)
        NumpadIns & k::PlaceTower("village", 447, 208)
        NumpadIns & l::PlaceTower("alch", 260, 363)
        NumpadIns & o::PlaceTower("ice", 745, 525) 
    #if
    #if (btd6_map = "Bloonarius Prime")
        NumpadIns & q::PlaceTower("dart", 230, 268)
        NumpadIns & w::PlaceTower("engineer", 958, 833)
        NumpadIns & e::PlaceTower("sniper", 861, 25)
        NumpadIns & r::PlaceTower("hero", 872, 800)
        NumpadIns & t::PlaceTower("sub", 722, 764)
        NumpadIns & y::PlaceTower("village", 857, 884)
        NumpadIns & u::PlaceTower("bomb", 973, 899)
        NumpadIns & i::PlaceTower("alch", 953, 1002)
        NumpadIns & o::PlaceTower("village", 857, 987)
        NumpadIns & p::PlaceTower("bomb", 963, 833)
        NumpadIns & a::PlaceTower("alch", 682, 912)
        NumpadIns & s::PlaceTower("village", 1064, 982)
        NumpadIns & d::PlaceTower("super", 970, 919) 
        NumpadIns & f::PlaceTower("engineer", 953, 1002)
        NumpadIns & g::PlaceTower("sniper", 1005, 1043)
        NumpadIns & h::PlaceTower("bomb", 953, 1002)
    #if
    #if (btd6_map = "Infernal")
        NumpadIns & q::PlaceTower("boomer", 836, 696)
        NumpadIns & w::PlaceTower("sniper", 1181, 798)
        NumpadIns & e::PlaceTower("hero", 494, 270)
        NumpadIns & r::PlaceTower("sniper", 1243, 815)
        NumpadIns & t::PlaceTower("dartling", 825, 383)
        NumpadIns & y::PlaceTower("alch", 881, 328)
        NumpadIns & i::PlaceTower("village", 1585, 674)
        NumpadIns & u::PlaceTower("spike", 1528, 545)
        NumpadIns & o::PlaceTower("alch", 1579, 594)
        NumpadIns & a::PlaceTower("glue", 839, 794)
        NumpadIns & p::PlaceTower("ice", 450, 222)
    #if
#if
