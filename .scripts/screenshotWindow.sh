#/bin/bash

#Give optional filename
fName="$(echo "" | rofi -dmenu -p "Enter filename ")"
wait

ADB_PATH=$(which adb)

# $ADB_PATH kill-server
# $ADB_PATH start-server
ADB_OUT=`$ADB_PATH devices | awk 'NR>1 {print $1}'`

#check if devices is connected
if test -n "$ADB_OUT"
then
    echo "Found connected device: $ADB_OUT"
    echo "Caputuring device screen image..."

    #when no filename was given, overwrite filename with date
    if [ -z "${fName// }" ]; then
        fName="$(echo shot-$(date '+%d-%b-%Y-%H-%M'))"
    fi


    #take screenshot
    adb exec-out screencap -p > ~/media/screenshots/$fName.png

    #notify
    echo "Image location: ~/media/screenshots/$fName.png"
    notify-send -i $HOME/media/wallpapers/icons/cute.png \
        -u critical "Screenshot successful!" "Image located at\n ~/media/screenshots/$fName.png"

else
    echo "Caputuring current active window..."

    #when no filename was given, overwrite filename with date
    if [ -z "${fName// }" ]; then
        fName="$(echo shot-$(date '+%d-%b-%Y-%H-%M'))"
    fi
    
    #take screenshot;
    # * -u: current focused window
    # * -o: overwrite existing
    scrot -u -o ~/media/screenshots/$fName.png -e 'xclip -selection clipboard -t image/png < $f'
    
    #only notify if ascreenshot was actually taken
    if [ $? -eq 0 ]; then
        notify-send -i $HOME/media/wallpapers/icons/cute.png \
            -u critical "Screenshot successful!" "Image located at\n ~/media/screenshots/$fName.png"
    fi
fi


