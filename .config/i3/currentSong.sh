#!/bin/bash
i3status --config ~/.currentSong.sh | while :
do
        playing=$(mpc current)
        echo "$playing" || exit 1
    done
