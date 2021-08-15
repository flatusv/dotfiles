#!/bin/bash

#if no scrcpy instance is running
if ! pgrep -x "scrcpy"; then
    # workaround: running with low resolution '-m 1024'
    autoadb scrcpy -m 1024

else
    #dont want abandoned processes
    pkill -f autoadb
    pkill -f scrcpy
fi
