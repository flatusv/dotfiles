#!/bin/bash



function f_twitch() {
    cat /tmp/streamer.txt \
    | fzf --multi --preview \
    'echo -e "Twitch: {1}\nPlaying:{2}\nStatus: $(cat /tmp/streamer.txt | cut -d " " -f4-)\nOnline since: {3}"' \
    | cut -d " " -f1
}

