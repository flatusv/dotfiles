#/bin/bash

#Save file with filename
fName=$(echo "" | rofi -dmenu -p "Enter filename ")
wait


#if we want to capture android device screenshot
if pgrep -x "scrcpy"; then

    adb exec-out screencap -p > ~/media/screenshots/$fName.png

else
    if scrot -u ~/media/screenshots/$fName.png -e 'xclip -selection clipboard -t "image/png" < $f' ; then
        notify-send -i $HOME/media/wallpapers/icons/cute.png -u critical "Screenshot successful!" "Image located at\n ~/media/screenshots/$fName.png"
    fi
fi

