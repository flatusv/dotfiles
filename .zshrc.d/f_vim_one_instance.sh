#/bin/bash

# switch focus to previous buffer
function go_back(){ vim --servername VIM --remote-send "<C-w>p" }

function f_vim_one_instance() {
    # If we are inside the terminal WITHIN vim..
    if [ -n "${VIM_TERMINAL}" ]; then
        # get out of the terminal
        go_back
        # edit the desired file
        vim --servername VIM --remote-send ":e "$@" <cr>"
        # get inside terminal again
        go_back
        # clear terminal 
        vim --servername VIM --remote-send "<C-l><C-l>"
        # back to editing
        go_back

        return
    fi

    #if there is no vim process already running...
    if ! pgrep -x "vim"; then

        #save current workspace pre vim launch
        #so we can change to it right after! 
        CWS=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name')

        i3-msg "move container to workspace 3" > /dev/null 2>&1
        i3-msg "workspace 3" > /dev/null 2>&1   #move focus to vim workspace

        if (( $# < 1 )); then
            # we just ran vim without any arguments at all
            command vim --servername VIM --remote-silent "$(mktemp /tmp/foo.XXX)"
        else
            # we want to edit some real file(s). Remove the first empty buffer
            command vim --servername VIM --remote-silent +:bd1 "$@"
        fi

        #wait for vim process to finish
        wait

        #go back to the workspace pre vim launch..
        i3-msg "move container to workspace $CWS" > /dev/null 2>&1
        i3-msg "workspace $CWS" >/dev/null 2>&1

    #there is a vim process running
    else
        command vim --servername VIM --remote-silent "$@"
        i3-msg "workspace 3" > /dev/null 2>&1   #switch to workspace
        exit
    fi
}
