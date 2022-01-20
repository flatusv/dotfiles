#!/bin/bash

if  [ "$(playerctl -s -p mpv,%any status)" == "Playing" ]
then
    currentTitle=$(playerctl -p mpv,%any metadata --format "{{ artist }} - {{ title }}" | sed 's/2020-.*:[0-9]\+$//')
    echo "mpv: $currentTitle"
fi

# echo -e "\n"
# # background color within border
# echo -e "#2b2b2b"
# # border color
# echo -e "#9180e8"
#
