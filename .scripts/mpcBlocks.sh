#!/bin/bash

if  [ "$(playerctl -s -p mpv,%any status)" == "Playing" ]
then

# - get current media
# - remove trailing dash
# - cut long strings and add dots (30 character tolerance)

currentTitle=$(playerctl -p mpv,%any metadata --format "{{ artist }} - {{ title }}" \
        | cut -d " " -f3- \
        | awk '{print substr($0, 1, 30) "..."}')
    echo "mpv: $currentTitle"
fi

# echo -e "\n"
# # background color within border
# echo -e "#2b2b2b"
# # border color
# echo -e "#9180e8"
#
