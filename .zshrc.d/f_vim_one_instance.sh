#/bin/bash

function f_vim_one_instance() {


    #remove padding
    # sed -i "s/x: 20/x: 0/g" ~/.config/alacritty/alacritty.yml
    # sed -i "s/y: 30/y: 0/g" ~/.config/alacritty/alacritty.yml

    wsVim=3

    #if there is no vim process already running...
    if ! pgrep -x "vim"; then

        #save current workspace pre vim launch
        #so we can change to it right after! 
        CWS=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name')

        i3-msg "move container to workspace 3" > /dev/null 2>&1
        i3-msg "workspace 3" > /dev/null 2>&1   #move focus to vim workspace

        command vim --servername $(command vim --serverlist | head -1) --remote-silent "$@"

        #wait for vim process to finish
        wait

        #go back to the workspace pre vim launch..
        i3-msg "move container to workspace $CWS" > /dev/null 2>&1
        i3-msg "workspace $CWS" >/dev/null 2>&1

    #there is a vim process running
    else
        command vim --servername $(command vim --serverlist | head -1) --remote-silent "$@" &
        i3-msg "workspace 3" > /dev/null 2>&1   #switch to workspace
        exit
    fi

    #add padding
    # sed -i "s/x: 0/x: 20/g" ~/.config/alacritty/alacritty.yml
    # sed -i "s/y: 0/y: 30/g" ~/.config/alacritty/alacritty.yml
}
