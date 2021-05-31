#/bin/bash


function f_vim_one_instance() {

    file="'$*'"

    #Vim is assigned to its specified workspace
    if ! pgrep -x "vim"; then 
        i3-msg 'move container to workspace number " 3:vim "' > /dev/null 2>&1
        i3-msg 'workspace " 3:vim "' > /dev/null 2>&1   #switch to workspace

        #Open the file in a new terminal instance, witch a different config and detach
        #from calling terminal

        nohup alacritty \
            --config-file=/home/geeray/.config/alacritty/alacritty-nogap.yml \
            -e sh \
            -c "command vim --servername $(command vim --serverlist | head -1) --remote-silent $file" >/dev/null 2>&1 &
        exit

    else 
        nohup alacritty \
            --config-file=/home/geeray/.config/alacritty/alacritty-nogap.yml \
            -e sh \
            -c "command vim --servername $(command vim --serverlist | head -1) --remote-silent $file" >/dev/null 2>&1 &
        i3-msg 'workspace " 3:vim "' > /dev/null 2>&1   #switch to workspace
        exit
    fi 
}

