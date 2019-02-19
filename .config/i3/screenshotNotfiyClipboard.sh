#/bin/bash

scrot -s /tmp/screenshot-$(date '+%d-%b-%Y_%H-%M').png -e 'xclip -selection clipboard -t "image/png" < $f'
notify-send -i $HOME/media/wallpapers/icons/cute.png -u critical "<b>Screenshot successful!</b>" "Image copied to clipboard"

