current_layer := "BTD6"
tower_click := false
tower_upgrade := false
btd6_map := "X Factor"
btd6_map := "Dark Castle"
; dumb syntax -> https://www.autohotkey.com/boards/viewtopic.php?t=66878
layer_list := ["Main"
    ,"Sugar * Style"
    ,"BTD6"
    ,"Dead Omegalul Aegis"
    ,"Rewrite"]

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
    ,"Dark Castle"]

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
; Sugar * Style
Numpad0 & Numpad8::
    current_layer := "Sugar * Style"
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
    current_layer := "Sugar * Style"
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
    #if (btd6_map = "Dark Castle") ; nvm i don't wanna do this map
        NumpadIns & q::PlaceTower("sub", 1090, 709)
        NumpadIns & p::PlaceTower("dart", 812, 657)
        NumpadIns & a::PlaceTower("dart", 747, 656)
        NumpadIns & i::PlaceTower("dart", 713, 704)
        NumpadIns & t::PlaceTower("hero", 878, 679)
        NumpadIns & j::PlaceTower("dart", 781, 763)

        NumpadIns & w::PlaceTower("dart", 1026, 447)
        NumpadIns & e::PlaceTower("dart", 961, 452)
        NumpadIns & r::PlaceTower("hero", 69, 482)

        NumpadIns & y::PlaceTower("bomb", 1025, 675)
        NumpadIns & u::PlaceTower("alch", 979, 721)
        NumpadIns & o::PlaceTower("bomb", 951, 661)
        NumpadIns & s::PlaceTower("dart", 713, 704)
        NumpadIns & d::PlaceTower("dart", 778, 706)
        NumpadIns & f::PlaceTower("dart", 836, 732)
        NumpadIns & g::PlaceTower("dart", 901, 737)
        NumpadIns & h::PlaceTower("dart", 716, 761)
        NumpadIns & k::PlaceTower("village", 831, 830)
        NumpadIns & z::PlaceTower("ice", 1029, 757)
        NumpadIns & x::PlaceTower("dart", 741, 813)
        NumpadIns & c::PlaceTower("dart", 1012, 452)
        NumpadIns & v::PlaceTower("", 0,0)
        NumpadIns & b::PlaceTower("", 0,0)
    #if
#if
