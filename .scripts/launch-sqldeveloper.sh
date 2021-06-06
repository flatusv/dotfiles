#!/bin/bash
JAVA_HOME=/usr/lib/jvm/java-15-openjdk
SQLD_HOME=/opt/oracle-sqldeveloper

# Launch Oracle's startup script asynchronously
env JAVA_HOME=$JAVA_HOME $SQLD_HOME/sqldeveloper.sh $* &

i="0"
while [ $i -lt 20 ]
do

# Try to get SQL Developer window ID
WIN_ID=$(xwininfo -root -tree \
| grep -i 'oracle sql developer' \
| grep -oP '(0x[a-f0-9]+)')

# If it is non-empty (window already exists)
if [ -n "$WIN_ID" ]
then
    echo "WIN_ID=$WIN_ID"

# Set WM_CLASS property of main window to same value
# that is used for the launcher window
    xprop -id $WIN_ID \
          -f WM_CLASS 8s \
          -set WM_CLASS "oracle-ide-osgi-boot-OracleIdeLauncher"

# and exit loop
    break
else

# Otherwise sleep for one second and increment loop counter
    echo "Sleeping: $i"
    sleep 1s
    i=$[$i+1]

fi
done

#move container to ws5
i3-msg '[title="SQL"] move container to workspace number " 5:idle "'
#switch focus to ws5
i3-msg 'workspace " 5:idle "'
echo "[Oracle-sqldeveloper]: Done"

setxkbmap us

#change to xkb
setxkbmap -option '' "vim"
#let our script now, that we are using xkb
echo "xkb" >| /tmp/kbdLayout.txt
echo "[SwitchKeyboard]: Using xkb layout!"

