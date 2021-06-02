#/bin/bash


function f_vim_one_instance() {

    file="'$*'"

    #Vim is assigned to its specified workspace
    if ! pgrep -x "vim"; then 
        #i3-msg 'move container to workspace number " 3:vim "' > /dev/null 2>&1

        #get current workspacw
        CWS=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name')

        #disappear calling terminal
        i3-msg 'move scratchpad' >/dev/null 2>&1

        #open vim in ws3
        i3-msg 'workspace " 3:vim "' > /dev/null 2>&1

        #Open the file in a new terminal instance, witch a different config and detach
        #from calling terminal
        nohup alacritty \
            --config-file=/home/geeray/.config/alacritty/alacritty-nogap.yml \
            -e sh \
            -c "command vim --servername $(command vim --serverlist | head -1) --remote-silent $file" >/dev/null 2>&1 &

        # wait for vim process to finish
        wait

        #switch to the orginial workspace
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


