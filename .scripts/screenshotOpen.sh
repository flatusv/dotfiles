#/bin/bash


# config file, which later becomes the symlink
CFG="${HOME}/.config/i3/config"
# window rules config file
CFGFOR="${CFG}-wrules"
# no window rules config file
CFGNOFOR="${CFG}-nrules"
# switch to configuration without for_window
ln -sf "$CFGNOFOR" "$CFG"
i3-msg reload

tmpfile=$(mktemp -u /tmp/shot_XXXXXX.png)
args=$(~/.scripts/xrectsel)
coordinates=( $args )

x=${coordinates[0]}
y=${coordinates[1]}
w=${coordinates[2]}
h=${coordinates[3]}

scrot -a $x,$y,$w,$h $tmpfile 
#wxh+x+y
sxiv -b -s w -g "$w"x"$h"+"$x"+"$y" "$tmpfile" 
# wait one second for the window to be initialized
# this may need to be longer for some applications
sleep 0.5
# switch back configuration
ln -sf "$CFGFOR" "$CFG"
i3-msg reload
