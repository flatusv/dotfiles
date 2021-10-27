#/bin/bash

function f_mpv(){ 

    # hide terminal by moving to scratchpad
    i3-msg 'move scratchpad'
    # play youtube playlists
    mpv --ytdl-raw-options="yes-playlist=" "$@"


    # move the selected items from to the clipboard
    cat /tmp/mpv_selection | xclip -selection clipboard 
}
