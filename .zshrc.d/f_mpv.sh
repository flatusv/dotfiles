#/bin/bash

function f_mpv(){ 

    # play youtube playlists
    mpv --ytdl-raw-options="yes-playlist=" "$@"
    # move the selected items from to the clipboard
    cat /tmp/mpv_selection | xclip -selection clipboard 
}
