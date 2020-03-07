#/bin/bash

function f_vim_one_instance() {

    #Vim is assigned to its specified workspace
    if ! pgrep -x "vim"; then 
        i3-msg 'move container to workspace number " 3:vim "' > /dev/null 2>&1
        i3-msg 'workspace " 3:vim "' > /dev/null 2>&1   #switch to workspace
        command vim --servername $(command vim --serverlist | head -1) --remote-silent "$@"
    else 
        command vim --servername $(command vim --serverlist | head -1) --remote-silent "$@" &
        i3-msg 'workspace " 3:vim "' > /dev/null 2>&1   #switch to workspace
        exit
    fi 
}
