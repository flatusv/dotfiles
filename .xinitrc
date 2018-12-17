#!/bin/sh

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap # needed for custom changes to key mappings

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

nitrogen --restore & # needed for wallpaper
exec i3
