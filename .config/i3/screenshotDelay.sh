#/bin/bash

# first specify delay time and notify for each second
for i in {3..1}; do dunstify -r 111 -i $HOME/media/wallpapers/icons/cute.png -u critical "Taking screenshot!" "in ...$i" && sleep 1; done
# close the notification by id, so that the notification doesnt get screenshoted
dunstify --close=111
# make the actual screenshot
scrot ~/media/screenshots/shot-$(date '+%d-%b-%Y-%H-%M').png -q 100 -e 'xclip-selection c -t image/png < $f'
# notifu that screenshot has been made
dunstify -i $HOME/media/wallpapers/icons/cute.png -u critical "Screenshot successful!" "Image located at\n ~/media/screenshots"

