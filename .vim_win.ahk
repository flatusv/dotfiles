#NoTrayIcon

SetCapsLockState, AlwaysOff

CapsLock & k::
if GetKeyState("Shift", "D")
    if GetKeyState("Alt", "D")
        Send +^{Up}
    else if GetKeyState("Ctrl", "D")
        Send +!{Up}
    else
        Send +{Up}
else if GetKeyState("Ctrl", "D")
    if (GetKeyState("Alt", "D"))
        Send !^{Up}
    else
        Send !{Up}
else if GetKeyState("Alt", "D")
    Send ^{Up}
else
    Send {Up}
return

CapsLock & j::
if GetKeyState("Shift", "D")
    if GetKeyState("Alt", "D")
        Send +^{Down}
    else if GetKeyState("Ctrl", "D")
        Send +!{Down}
    else
        Send +{Down}
else if GetKeyState("Ctrl", "D")
    if (GetKeyState("Alt", "D"))
        Send !^{Down}
    else
        Send !{Down}
else if GetKeyState("Alt", "D")
    Send ^{Down}
else
    Send {Down}
return

CapsLock & h::
if GetKeyState("Shift", "D")
    if GetKeyState("Alt", "D")
        Send +^{Left}
    else if GetKeyState("Ctrl", "D")
        Send +!{Left}
    else
        Send +{Left}
else if GetKeyState("Ctrl", "D")
    if (GetKeyState("Alt", "D"))
        Send !^{Left}
    else
        Send !{Left}
else if GetKeyState("Alt", "D")
    Send ^{Left}
else
    Send {Left}
return

CapsLock & l::
if GetKeyState("Shift", "D")
    if GetKeyState("Alt", "D")
        Send +^{Right}
    else if GetKeyState("Ctrl", "D")
        Send +!{Right}
    else
        Send +{Right}
else if GetKeyState("Ctrl", "D")
    if (GetKeyState("Alt", "D"))
        Send !^{Right}
    else
        Send !{Right}
else if GetKeyState("Alt", "D")
    Send ^{Right}
else
    Send {Right}
return


Capslock & a::
	GetKeyState, state, Shift
	If state = D
		Send, Ä
	else
		Send, ä
Return

; Umlaut u
Capslock & u::
	GetKeyState, state, Shift
	If state = D
		Send, Ü
	else
		Send, ü
Return

; Umlaut o
Capslock & o::
	GetKeyState, state, Shift
	If state = D
		Send, Ö
	else
		Send, ö
Return

; Further Symbols/Umlauts
Capslock & s::Send, ß
Capslock & e::Send, €
