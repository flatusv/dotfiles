#!/bin/bash
export DISPLAY=:0

#necessary to be displayed for cronjob
if [ -r "$HOME/.dbus/Xdbus" ]; then
    . "$HOME/.dbus/Xdbus"
    fi



battery_level=$(/usr/bin/acpi -b | grep -P -o '[0-9]+(?=%)') #determine battery level as percentage
rem=$(/usr/bin/acpi -b | cut -f 5 -d " ") #determine time until no power
charge=$(acpi -b | cut -f 3 -d " " | rev | cut -c2- | rev) #is it charging? do not display during charge



if  [ "$charge" == "Charging" ]; then
  exit
elif [ $battery_level -le 20 ]; then
    /usr/bin/notify-send -a "Battery low" -t 10000 "Battery level: ${battery_level}%" "time left: $rem"

fi

