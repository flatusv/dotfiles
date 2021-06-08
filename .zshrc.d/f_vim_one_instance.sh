#/bin/bash

function f_vim_one_instance() {


    #remove padding
    sed -i "s/x: 20/x: 0/g" ~/.config/alacritty/alacritty.yml
    sed -i "s/y: 30/y: 0/g" ~/.config/alacritty/alacritty.yml




    #if there is no vim process running...
    if ! pgrep -x "vim"; then

        #we want to switch to the workspace where we were before running vim
        CWS=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name')

        i3-msg 'move container to workspace number " 3:vim "' > /dev/null 2>&1
        i3-msg 'workspace " 3:vim "' > /dev/null 2>&1   #switch to workspace

        #edit temporary file if no filename was given
        if [ $# -lt 1 ]; then
            CWD=$(pwd)
            TMPFILE=$(mktemp -u $CWD/tmp-XXXX.txt)
            command vim --servername $(command vim --serverlist | head -1) --remote-silent "$TMPFILE"

        #launch vim with files
        else
            command vim --servername $(command vim --serverlist | head -1) --remote-silent "$@"
        fi

        #wait for vim process to finish
        wait


        #go to the original workspace, in which we started vim
        i3-msg "move container to workspace number $CWS" > /dev/null 2>&1
        i3-msg "workspace $CWS" >/dev/null 2>&1

    #there is a vim process running
    else
        command vim --servername $(command vim --serverlist | head -1) --remote-silent "$@" &
        i3-msg 'workspace " 3:vim "' > /dev/null 2>&1   #switch to workspace
        exit
    fi

    #add padding
    sed -i "s/x: 0/x: 20/g" ~/.config/alacritty/alacritty.yml
    sed -i "s/y: 0/y: 30/g" ~/.config/alacritty/alacritty.yml
}
