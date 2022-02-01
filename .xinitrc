#!/bin/sh

 # needed for custom changes to key mappings
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap  && echo "xmodmap" > /tmp/kbdLayout.txt

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# nitrogen --restore & # needed for wallpaper
xsetroot -bitmap $HOME/media/wallpapers/bitmap-walls-master/bw-bgnd/granite.xbm  -bg "#201623" -fg "#000000"

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
exec i3
