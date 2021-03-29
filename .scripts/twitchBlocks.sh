#!/bin/bash
if [ -s /tmp/streamer.txt ]
    then
        echo "twitch: <span foreground='#dccdfb'><b>$(cat /tmp/streamer.txt | tr '\n' ',' | sed 's/.$//')</b></span>"
fi
