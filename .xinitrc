#!/bin/sh

 # needed for custom changes to key mappings
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap  && echo "default" > /tmp/kbdLayout.txt

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# nitrogen --restore & # needed for wallpaper
xsetroot -bitmap $HOME/media/wallpapers/bitmap-walls-master/bw-bgnd/arabic_floor.xbm  -bg "#000000" -fg "#201623" 
exec i3
