#/bin/bash

scrot -s /tmp/screenshot-$(date '+%d-%b-%Y_%H-%M').png -e 'xclip -selection c -t image/png
< $f' && notify-send -u critical "Screnshot" "Saved image to clipboard"

