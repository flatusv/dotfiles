#!/usr/bin/bash

CHOICE=$(echo -e "xmodmap: (default)\nxkb: (vim-like navigation)" | rofi -dmenu -p "Choose Layout > ")
echo $choice


#check if the selection was the default layout (xmodmap)
if echo "$CHOICE" | grep -q "default"; then
    #reset the current layout
    setxkbmap us
    #then switch to xmodmap
    xmodmap ~/.Xmodmap
else
    #reset the current layout
    setxkbmap us
    setxkbmap -option '' "vim"
fi

