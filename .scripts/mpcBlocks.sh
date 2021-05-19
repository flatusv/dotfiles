#!/bin/bash

if  [ "$(playerctl status)" == "Playing" ]
   then
       echo "mpv: <span foreground='#dccdfb'><b>$(playerctl metadata --format "{{ artist }} {{ title }}" | sed 's/2020-.*:[0-9]\+$//')</b></span>"
fi

