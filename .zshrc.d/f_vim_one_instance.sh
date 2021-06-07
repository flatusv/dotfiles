#/bin/bash

function f_vim_one_instance() {

    sed -i "s/x: 20/x: 0/g" .config/alacritty/alacritty.yml
    sed -i "s/y: 30/y: 0/g" .config/alacritty/alacritty.yml

    #[ATTENTION]: This fixes spaces in filenames!
    # but makes it impossible to launch vim with more than one file
    #file="'$*'"

    ##if launched without specifying a filename...
    #if [ $# -lt 1 ]; then
    #    CWD=$(pwd)
    #    file=$CWD/temporaryFile.txt
    #fi

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

    sed -i "s/x: 0/x: 20/g" .config/alacritty/alacritty.yml
    sed -i "s/y: 0/y: 30/g" .config/alacritty/alacritty.yml
}
