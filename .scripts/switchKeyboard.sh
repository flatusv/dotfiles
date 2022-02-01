#!/usr/bin/bash

function notify(){
    notify-send -i $HOME/media/wallpapers/icons/cute.png -u critical \
        "Keyboard Changed!" "Now using: $(cat /tmp/kbdLayout.txt)"
}

#cycle between xmodmap and xkb, depending on which is currently in effect
if grep -q "xmodmap" /tmp/kbdLayout.txt; then
    #reset the current layout
    setxkbmap us
    
    #change to xkb
    setxkbmap -option '' "vim"

    #let our script now, that we are using xkb
    echo "xkb" >| /tmp/kbdLayout.txt
    echo "[KBD]: xkb"

    notify

    exit
fi

#switch to xmodmap (default) if xkb was detected
if grep -q "xkb" /tmp/kbdLayout.txt; then
    #reset the current layout
    setxkbmap us

    #then switch to xmodmap
    xmodmap ~/.Xmodmap

    #let our script now, that we are using xmodmap
    echo "xmodmap" >| /tmp/kbdLayout.txt
    echo "[KBD]: xmodmap"

    notify

    exit
fi

