#/bin/bash

#Specify filename
fName=$(echo "" | rofi -dmenu -p "Enter filename ")


#check empty string
if [ -z "${fName// }" ]; then

    #save screenshot with timestamp
    scrot -s ~/media/screenshots/shot-$(date '+%d-%b-%Y-%H-%M').png \
        -q 100 -e 'xclip-selection c -t image/png < $f'

    #only notify if screenshot was taken
    if [ $? -eq 0 ]; then
        notify-send -i $HOME/media/wallpapers/icons/cute.png \
            -u critical "Screenshot successful!" "Image located at ~/media/screenshots"
    fi
else
    #save screenshot with the given filename
    scrot -s ~/media/screenshots/$fName.png -e 'xclip-selection c -t image/png < $f'

    #only notify if screenshot was taken
    if [ $? -eq 0 ]; then
        notify-send -i $HOME/media/wallpapers/icons/cute.png \
            -u critical "Screenshot successful!" "Image located at\n ~/media/screenshots/$fName.png"
    fi
fi





