#/bin/bash

#Specify filename
fName=$(echo "" | rofi -dmenu -p "Enter filename ")


#check empty string
if [ -z "${fName// }" ]; then
    fName="$(echo shot-$(date '+%d-%b-%Y-%H-%M'))"
fi

#take screenshot
# * -s: selection
# * -o: overwrite existing
scrot \
    -o \
    -s ~/media/screenshots/$fName.png \
    -q 100 \
    -e 'xclip -selection clipboard -t image/png < $f'

#only notify if screenshot was taken
if [ $? -eq 0 ]; then
    notify-send -i $HOME/media/wallpapers/icons/cute.png \
        -u critical "Screenshot successful!" "Image located at ~/media/screenshots"
fi
