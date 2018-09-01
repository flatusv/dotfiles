#/bin/bash

scrot -s ~/media/screenshots/shot-$(date '+%d-%b-%Y-%H-%M').png -q 100 -e 'xclip-selection
c -t image/png < $f' && notify-send -u critical "Screenshot successful!" "Image located at ~/media/screenshots"

