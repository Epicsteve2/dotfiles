
discordOrStrawberry() {
    IfWinActive, ahk_exe Discord.exe 
    {
        ; WinActivate, ahk_exe strawberry.exe
        launchOrSwitchMusic()
    }
    Else
    {
        ; WinActivate, ahk_exe Discord.exe
        launchOrSwitchDiscord()
    }
    Return
}

launchOrSwitchFirefox()
{
    IfWinExist, ahk_exe firefox.exe
    {
        WinActivate, ahk_exe firefox.exe
    } 
    Else
    {
        Run "C:\Users\Stephen\AppData\Local\Mozilla Firefox\firefox.exe"
    }
    Return
}

launchOrSwitchDiscord()
{
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

launchOrSwitchMusic()
{
    IfWinExist, ahk_exe strawberry.exe
    {
        WinActivate, ahk_exe strawberry.exe
    } 
    Else
    {
        Run "C:\Program Files\Strawberry Music Player\strawberry.exe"
    }
    Return
}
launchOrSwitchCode()
{
    IfWinExist, ahk_exe Code.exe
    {
        WinActivate, ahk_exe Code.exe
    } 
    Else
    {
        Run "C:\Users\Stephen\AppData\Local\Programs\Microsoft VS Code\Code.exe"
    }
    Return
}

ifRewrite(key, x, y)
{
    IfWinActive, ahk_exe SiglusEngine_SteamEN.exe
    {
        clickAndReturn(x, y)
    } 
    Else
    {
        SendInput, {%key%}
        ; Hotkey, %key%, Label, Options]Hotkey Hotkey
    }
    Return
}

; LWin & LControl::
;     If GetKeyState("1", "P")
;         discordOrStrawberry()
; Return

; NumpadIns::Numpad0
; NumpadIns up::Send {NumpadIns0}

clickAndReturn(x, y) {
    SetDefaultMouseSpeed, 0
    MouseGetPos, x_original, y_original 
    ; TrayTip Title, The cursor is at x=%x_original% y=%y_original%.
    Send {Click %x%, %y%}
    ; idk why i need this lol
    ; more info -> //www.autohotkey.com/board/topic/57890-return-mouse-to-original-position-after-auto-click/?p=363564
    CoordMode, Mouse, Screen
    MouseMove, x_original, y_original
    Return
}

Pause::f15
Insert::F13
ScrollLock::F14
; RWin::F15
NumpadDiv::Media_Prev
NumpadMult::Media_Play_Pause
NumpadSub::Media_Next
; Calculator
; Launch_App2::Media_Next
; RWin::Media_Play_Pause
; NumpadAdd 	
; Space::Enter

; CapsLock::AppsKey

; RWin::AppsKey

Numpad0::return
Numpad0 up::Send {Numpad0}
; NumpadIns
Numpad0 & Numpad1::discordOrStrawberry()
Numpad0 & Numpad2::launchOrSwitchFirefox()
Numpad0 & Numpad3::launchOrSwitchCode()
Numpad0 & a::clickAndReturn(1016, 1057)
Numpad0 & s::clickAndReturn(1709, 931)
Numpad0 & t::clickAndReturn(1707, 985)
Numpad0 & l::clickAndReturn(1836, 934)
Numpad0 & f::clickAndReturn(1165, 1065)
Numpad0 & NumpadDiv::NumpadDiv
Numpad0 & NumpadMult::NumpadMult
Numpad0 & NumpadSub::NumpadSub
Numpad0 & CapsLock::CapsLock

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
$Space::
    IfWinActive, ahk_exe SiglusEngine_SteamEN.exe
    {
        SendInput, {Enter}
    } 
    Else
    {
        SendInput, {Space}
    }
Return

CapsLock::Esc 

Numpad0 & /::
    MouseGetPos, x_position, y_position 
    TrayTip Current cursor position, The cursor is at x=%x_position% y=%y_position%.
return

Numpad0 & .::
    WinGetActiveTitle, currentTitle
    TrayTip Current window class, The window title is %currentTitle%
    ; WinGetClass, windowClass, ahk_exe SiglusEngine_SteamEN.exe
    ; TrayTip Current window class, The window class is %windowClass%
return
