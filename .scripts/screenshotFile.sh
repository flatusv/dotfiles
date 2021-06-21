#/bin/bash

#Save file with filename
fName=$(echo "" | rofi -dmenu -p "Enter filename ")

if scrot -s ~/media/screenshots/$fName.png -e 'xclip-selection c -t image/png < $f' ; then
    notify-send -i $HOME/media/wallpapers/icons/cute.png \
        -u critical "Screenshot successful!" "Image located at\n ~/media/screenshots/$fName.png"
fi

