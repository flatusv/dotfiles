#!/usr/bin/bash

#cycle between xmodmap and xkb, depending on which is currently in effect
if grep -q "default" /tmp/kbdLayout.txt; then
    #reset the current layout
    setxkbmap us
    
    #change to xkb
    setxkbmap -option '' "vim"

    #let our script now, that we are using xkb
    echo "xkb" >| /tmp/kbdLayout.txt
    echo "[SwitchKeyboard]: Using xkb layout!"
    exit
fi

#switch to xmodmap (default) if xkb was detected
if grep -q "xkb" /tmp/kbdLayout.txt; then
    #reset the current layout
    setxkbmap us

    #then switch to xmodmap
    xmodmap ~/.Xmodmap

    #let our script now, that we are using xkb
    echo "default" >| /tmp/kbdLayout.txt
    echo "[SwitchKeyboard]: Using xmodmap layout!"
    exit
fi

