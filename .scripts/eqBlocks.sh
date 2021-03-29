#!/bin/bash

status=$(pulseaudio-equalizer status | grep "Equalizer status" | cut -d ' ' -f 3 | awk -F'[][]' '{print $2}')
echo "EQ: <span foreground='#dccdfb'><b>$status</b></span>"
