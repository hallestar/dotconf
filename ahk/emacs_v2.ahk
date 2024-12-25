InstallKeybdHook
#UseHook

; 全局变量定义
SetKeyDelay 0
global is_pre_x := 0
global is_pre_spc := 0
; glboal SetKeyDelay := 0

; 定义是否为目标应用程序的函数
is_target() {
    ;  HotIfWinActive "ahk_class ConsoleWindowClass" ; Cygwin
    ;    Return 1
    if WinActive("ahk_class MEADOW") ; Meadow
    {
        return true
    }

    if WinActive("ahk_class MozillaUIWindowClass") ; keysnail on Firefox
    {
        return true
    }

    ; Avoid VMwareUnity with AutoHotkey
    if WinActive("ahk_class VMwareUnityHostWndClass") {
        return true
    }

    if WinActive("ahk_class Vim") ; GVIM
    {
        return true
    }

    if WinActive("ahk_class SunAwtFrame") ; jb
    {
        return true
    }

    if WinActive("ahk_exe WindowsTerminal.exe") ;
    {
        return true
    }

    if WinActive("ahk_exe Code.exe") ; vscode
    {
        return true
    }
    if WinActive("ahk_exe SecureCRT.exe") ; scrt
    {
        return true
    }
    if WinActive("ahk_class VirtualConsoleClass") ;cmder
    {
        return true
    }
    if WinActive("ahk_class TTOTAL_CMD") ; total_cmd
    {
        return true
    }
    if WinActive("ahk_exe devenv.exe") ; visual studio
    {
        return true
    }
    if WinActive("ahk_exe pycharm64.exe") {
        return true
    }
    if WinActive("ahk_exe WeTERM.exe") {
        return true
    }
    if WinActive("ahk_exe winhex.exe") {
        return true
    }
    if WinActive("ahk_exe rider64.exe") {
        return true
    }
    if WinActive("ahk_exe UnrealEditor.exe") {
        return true
    }
    if WinActive("ahk_exe Figma.exe") {
        return true
    }
    if WinActive("ahk_exe lapce.exe") {
        return true
    }
    if WinActive("ahk_exe Obsidian.exe") {
        return true
    }
    if WinActive("ahk_exe sublime.exe") {
        return true
    }
    if WinActive("ahk_exe sublime_text.exe") {
        return true
    }
    if WinActive("ahk_exe nvim-qt.exe") {
        return true
    }
    if WinActive("ahk_exe Notion.exe") {
        return true
    }
    if WinActive("ahk_exe FluentSearch.exe") {
        return true
    }
    if WinActive("ahk_class PPTFrameClass") {
        return true
    }
    if WinActive("ahk_class XGAME") {
        return true
    }
    if WinActive("ahk_exe PotPlayerMini64.exe") {
        return true
    }
    if WinActive("ahk_exe Last Epoch.exe") {
        return true
    }
    if WinActive("ahk_exe Wireshark.exe") {
        return true
    }
    if WinActive("ahk_class UnrealWindow") {
        return true
    }
    if WinActive("ahk_class dbgviewClass") {
        return true
    }
    if WinActive("ahk_exe StarUML.exe") {
        return true
    }
    if WinActive("ahk_exe Cursor.exe") {
      return true
    }
    if WinActive("ahk_exe sublime_text.exe") {
      return true
    }
    if WinActive("ahk_class Qt660QWindowIcon") {
        return true
    }

    ;  HotIfWinActive ahk_class SWT_Window0 ; Eclipse
    ;    Return 1
    ;   HotIfWinActive ahk_class Xming X
    ;     Return 1
    ;   HotIfWinActive ahk_class SunAwtFrame
    ;     Return 1
    ;   HotIfWinActive ahk_class Emacs ; NTEmacs
    ;     Return 1
    ;   HotIfWinActive ahk_class XEmacs ; XEmacs on Cygwin
    ;     Return 1

    return 0
}

reset_is_pre_spc() {
    global
    is_pre_spc := 0
}

set_is_pre_spc() {
    global
    is_pre_spc := 1
}

check_is_pre_spc() {
    global
    if (is_pre_spc) {
        return true
    } else {
        return false
    }
}

reset_is_pre_x() {
  global
  is_pre_x := 0
}

set_is_pre_x() {
  global
  is_pre_x := 1
}

check_is_pre_x() {
  global
  if (is_pre_x) {
      return true
  } else {
      return false
  }
}

delete_char() {
    Send "{Del}"
    reset_is_pre_spc()
    return
}

delete_backward_char() {
    Send "{BS}"
    reset_is_pre_spc
    return
}

kill_line() {
    Send "{ShiftDown}{END}{SHIFTUP}"
    Sleep 50 ;[ms] this value depends on your environment
    Send "^x"
    reset_is_pre_spc()

    return
}

open_line() {
    Send "{END}{Enter}{Up}"
    reset_is_pre_spc()

    return
}

quit() {
    Send "{ESC}"
    reset_is_pre_spc()

    return
}

newline() {
    Send "{Enter}"
    reset_is_pre_spc()

    return
}

indent_for_tab_command() {
    Send "{Tab}"
    reset_is_pre_spc()

    return
}

newline_and_indent() {
    Send "{Enter}{Tab}"
    reset_is_pre_spc()

    return
}

isearch_forward() {
    Send "^f"
    reset_is_pre_spc()

    return
}

isearch_backward() {
    Send "^f"
    reset_is_pre_spc()

    return
}

kill_region() {
    Send "^x"
    reset_is_pre_x()

    return
}

kill_ring_save() {
    Send "^c"
    reset_is_pre_spc()

    return
}

yank() {
    Send "^v"
    reset_is_pre_spc()

    return
}

undo() {
    Send "^z"
    reset_is_pre_spc()

    return
}

find_file() {
    Send "^o"
    reset_is_pre_x()

    return
}

save_buffer() {
    Send "^s"
    reset_is_pre_x()

    return
}

kill_emacs() {
    Send "!{F4}"
    reset_is_pre_x()

    return
}

move_beginning_of_line() {
    if (check_is_pre_spc()) {

        Send "+{HOME}"
    } else {

        Send "{HOME}"
    }
    return
}

move_end_of_line() {
    if (check_is_pre_spc()) {

        Send "+{END}"
    } else {

        Send "{END}"
    }
    return
}

previous_line() {
    if (check_is_pre_spc()) {
        Send "+{Up}"
    } else {
        Send "{Up}"
    }
    return
}

next_line() {
    if (check_is_pre_spc()) {
        Send "+{Down}"
    } else {
        Send "{Down}"
    }
    return
}

forward_char() {
    if (check_is_pre_spc()) {
        Send "+{Right}"
    } else {
        Send "{Right}"
    }
    return
}

backward_char() {
    if (check_is_pre_spc()) {
        Send "+{Left}"
    } else {
        Send "{Left}"
    }
    return
}

scroll_up() {
    if (check_is_pre_spc()) {
        Send "+{PgUp}"
    } else {
        Send "{PgUp}"
    }
    return
}

scroll_down() {
    if (check_is_pre_spc()) {
        Send "+{PgDn}"
    } else {
        Send "{PgDn}"
    }
    return
}

^x::
{
    if (is_target()) {
        Send A_ThisHotkey
    } else {
        ; ListVars
        ; Pause
        set_is_pre_x()

        ; MsgBox Format("ThisHotkey: {1} is_target: {2}, is_pre_x: {3}", A_ThisHotkey, is_target(), is_pre_x)
    }
    return
}

^f::
{
    ; MsgBox Format("ThisHotkey: {1} is_target: {2}, is_pre_x: {3}", A_ThisHotkey, is_target(), is_pre_x)

    if (is_target()) {
        Send A_ThisHotkey
    } else {
        if (check_is_pre_x()) {
            find_file()
        } else {
            forward_char()
        }
    }
    return
}

^c::
  {
    If(check_is_pre_x())
    {
      kill_region()
    }
    Else
    {
      Send A_ThisHotkey
    }
    Return
  }

^d::
{
    if (is_target()) {
        Send A_ThisHotkey
    } else {
        delete_char()
        return
    }
}

^h::
{
    if (is_target()) {
        Send A_ThisHotkey
    } else {
        delete_backward_char()
    }
    return
}
; ;^k::
; ;  If is_target()
; ;    Send A_ThisHotkey
; ;  Else
; ;    kill_line()
; ;  Return
; ;; ^o::
; ;;   If is_target()
; ;;     Send A_ThisHotkey
; ;;   Else
; ;;     open_line()
; ;;   Return
; ;^g::
; ;  If is_target()
; ;    Send A_ThisHotkey
; ;  Else
; ;    quit()
; ;  Return
; ;; ^j::
; ;;   If is_target()
; ;;     Send A_ThisHotkey
; ;;   Else
; ;;     newline_and_indent()
; ;;   Return
^m::
{
    if is_target() {
        Send A_ThisHotkey
    } else {
        newline()
    }
    return
}
; ;^i::
; ;  If is_target()
; ;    Send A_ThisHotkey
; ;  Else
; ;    indent_for_tab_command()
; ;  Return

^s::
{
    if (is_target()) {
        Send A_ThisHotkey
    } else {
        if (check_is_pre_x()) {
            save_buffer()
        } else {
            isearch_forward()
        }
    }
    return
}

; ;^r::
; ;  If is_target()
; ;    Send A_ThisHotkey
; ;  Else
; ;    isearch_backward()
; ;  Return

; ;^w::
; ;  If is_target()
; ;    Send A_ThisHotkey
; ;  Else
; ;    kill_region()
; ;  Return

; ;!w::
; ;  If is_target()
; ;    Send A_ThisHotkey
; ;  Else
; ;    kill_ring_save()
; ;  Return

; ;^y::
; ;  If is_target()
; ;    Send A_ThisHotkey
; ;  Else
; ;    yank()
; ;  Return

; ; ^/::
; ;   If is_target()
; ;     Send A_ThisHotkey
; ;   Else
; ;     undo()
; ;   Return
;
;$^{Space}::
;^vk20sc039::
^vk20::
{
    if (is_target()) {
        Send "{CtrlDown}{Space}{CtrlUp}"
    } else {
        if (check_is_pre_spc()) {
            reset_is_pre_spc()
        } else {
            set_is_pre_spc()
        }
    }
    return
}

^@::
{
    if (is_target()) {
        Send A_ThisHotkey
    } else {
        if (check_is_pre_spc()) {
            reset_is_pre_spc()
        } else {
            set_is_pre_spc()
        }
    }
    return
}

^a::
{
    if (is_target()) {
        Send A_ThisHotkey
    } else {
        move_beginning_of_line()
    }
    return
}

^e::
{
    if (is_target()) {
        Send A_ThisHotkey
    } else {
        move_end_of_line()
    }
    return
}

^p::
{
    if (is_target()) {
        Send A_ThisHotkey
    } else {
        previous_line()
    }
    return
}

^n::
{
    if (is_target()) {
        Send A_ThisHotkey
    } else {
        next_line()
    }
    return
}

^b::
{

    if (is_target()) {
        Send A_ThisHotkey
    } else {
        backward_char()
    }
    return
}

; ;^v::
; ;  If is_target()
; ;    Send A_ThisHotkey
; ;  Else
; ;    scroll_down()
; ;  Return

; ;!v::
; ;  If is_target()
; ;    Send A_ThisHotkey
; ;  Else
; ;    scroll_up()
; ;  Return

CapsLock::
{
    Send "{Esc}"
    return
}

; ^Space::ControlSend, ,^{Space Down}{Space Up},ahk_class Emacs	; Sends simulated keystrokes to a window or control
