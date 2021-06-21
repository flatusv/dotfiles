#!/bin/bash

#if no scrcpy instance is running
if ! pgrep -x "scrcpy"; then
    notify-send -i $HOME/media/wallpapers/icons/android.png \
        -u critical "Android Emulator" "started android emulator process!"

    autoadb scrcpy -s '{}'

else
    #dont want abandoned processes
    pkill -f autoadb
    pkill -f scrcpy
fi
