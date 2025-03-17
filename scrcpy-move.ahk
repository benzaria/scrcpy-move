/**
 * @description A script to move around a borderless scrcpy window
 * @author Benzaria
 * @date 15/03/2025
 * @version 1.1.0
 * !! Before Modifing !!
 * @see https://www.autohotkey.com/docs/v2/Hotkeys.htm  ; For hotkeys assigning
 * @see https://www.autohotkey.com/docs/v2/lib/Win.htm  ; For window manipulation
 * @see https://www.autohotkey.com/docs/v2/             ; For all documentations
 */

#SingleInstance Force              ; Force a Single Instance of the script to be running
#Requires AutoHotkey >=2.0         ; Requires autohotkey v2.0 or higher
Persistent                         ; Prevent the script from exiting
SetTitleMatchMode 3                ; Match exact window title
scrcpyExe := "ahk_exe scrcpy.exe"  ; Match the process name

; Move distance
smallStep := 5   ; Normal move
bigStep := 30    ; Faster move with Shift

; Active only if the current window is scrcpy
#HotIf WinActive(scrcpyExe)

; Custom position Coord 'default: 10:10'
custom_X := 10
custom_Y := 10

; Move window to a relative Pos
MoveScrcpyBy(xOffset := 0, yOffset := 0) {
    WinGetPos &X, &Y, , , scrcpyExe
    WinMove X + xOffset, Y + yOffset, , , scrcpyExe
}

; Move window to an obsolut Pos
MoveScrcpyTo(x?, y?) {
    WinMove x?, y?, , , scrcpyExe
}

; Normal move (Ctrl + Alt + Arrows)
^!Up:: MoveScrcpyBy , -smallStep
^!Down:: MoveScrcpyBy , smallStep
^!Left:: MoveScrcpyBy -smallStep
^!Right:: MoveScrcpyBy smallStep

; Faster move (Ctrl + Alt + Shift + Arrows)
^+!Up:: MoveScrcpyBy , -bigStep
^+!Down:: MoveScrcpyBy , bigStep
^+!Left:: MoveScrcpyBy -bigStep
^+!Right:: MoveScrcpyBy bigStep

; Push Left (Ctrl + Alt + Home)
^!Home:: MoveScrcpyTo smallStep

; Push Right (Ctrl + Alt + End)
^!End:: {
    WinGetPos , , &W, , scrcpyExe
    MoveScrcpyTo A_ScreenWidth - W - smallStep
}

; Push Up (Ctrl + Alt + PageUp)
^!PgUp:: MoveScrcpyTo , smallStep

; Push Down (Ctrl + Alt + PageDown)
^!PgDn:: {
    WinGetPos , , , &H, scrcpyExe
    MoveScrcpyTo , A_ScreenHeight - H - smallStep
}

; Center window (Ctrl + Alt + Enter)
^!Enter:: {
    WinGetPos , , &W, &H, scrcpyExe
    MoveScrcpyTo (A_ScreenWidth - W) // 2, (A_ScreenHeight - H) // 2
}

; Go to Custom position (Alt + Enter)
!Enter:: MoveScrcpyTo custom_X, custom_Y

; Toggle window Always on Top prop (Alt + Space)
!Space:: WinSetAlwaysOnTop -1, 'A'

; Quit the scrcpy window (Alt + q) alternative to Force quit 'Alt + F4'
!q:: WinClose scrcpyExe