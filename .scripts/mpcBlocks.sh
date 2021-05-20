#!/bin/bash

if  [ "$(playerctl status)" == "Playing" ]
then
    currentTitle=$(playerctl metadata --format "{{ artist }} - {{ title }}" | sed 's/2020-.*:[0-9]\+$//')
    echo "mpv: <span foreground='#dccdfb'><b>$currentTitle</b></span>"
fi

echo -e "\n"
# background color within border
echo -e "#2b2b2b"
# border color
echo -e "#9180e8"

