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

scrot -s $tmpfile 
sxiv "$tmpfile" 
# wait one second for the window to be initialized
# this may need to be longer for some applications
sleep 1
# switch back configuration
ln -sf "$CFGFOR" "$CFG"
i3-msg reload
