#!/usr/bin/bash
#
#   record the screenn in i3wm 
#   hit $win+r to enter record mode
#
#   script catches the correct screen size
#   and puts output in ~/media/screenshots/

xAxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
yAxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)


notify-send "Started Recording" "capturing screen.."
ffmpeg -f x11grab  -s "$xAxis"x"$yAxis" -i :0.0 -r 45 -vcodec libx264  ~/media/screenshots/$(date '+%d-%b-%Y_%H-%M').mkv




if [ "$?" -eq "0" ]
then
  echo "ok"
else
    notify-send "Stopped recording" "screen has been recorded.."
fi

