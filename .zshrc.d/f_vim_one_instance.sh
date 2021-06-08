#/bin/bash


function f_vim_one_instance() {

    #[ATTENTION]: This fixes spaces in filenames!
    # but makes it impossible to launch vim with more than one file
    file="'$*'"

    #if launched without specifying a filename...
    if [ $# -lt 1 ]; then 
        CWD=$(pwd)
        file=$CWD/temporaryFile.txt
    fi

    # if no vim instance is running, or starting vim without specifiying a file
    if [ ! pgrep -x "vim" ]; then 

        #[DEPRECATED]: Line below may be deleted in a future commit!
        #i3-msg 'move container to workspace number " 3:vim "' > /dev/null 2>&1

        #we want to switch to the workspace where we were before running vim
        CWS=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name')

        #disappear calling terminal
        i3-msg 'move scratchpad' >/dev/null 2>&1

        #focus the workspace where we want to launch vim
        i3-msg 'workspace " 3:vim "' > /dev/null 2>&1

        #[FIX]: Launch vim without a filename
        if [ $# -lt 1 ]; then 
            # command vim --servername $(command vim --serverlist | head -1) >/dev/null 2>&1 &
        fi

        #Launch vim with another terminal config and detach it from calling processs
        nohup alacritty \
            --config-file=/home/geeray/.config/alacritty/alacritty-nogap.yml \
            -e sh \
            -c "command vim --servername $(command vim --serverlist | head -1) --remote-silent $file" >/dev/null 2>&1 &

        #wait for vim process to finish
        wait

        #don't pollute screen
        clear

        i3-msg "workspace $CWS" >/dev/null 2>&1
        #make calling terminal appear again
        i3-msg "scratchpad show" >/dev/null 2>&1
        #maximize it on screen
        i3-msg "floating disable" >/dev/null 2>&1

        #exit

    else 
        nohup alacritty \
            --config-file=/home/geeray/.config/alacritty/alacritty-nogap.yml \
            -e sh \
            -c "command vim --servername $(command vim --serverlist | head -1) --remote-silent $file" >/dev/null 2>&1 &

        #switch to workspace
        i3-msg 'workspace " 3:vim "' > /dev/null 2>&1
        exit
    fi 
}


