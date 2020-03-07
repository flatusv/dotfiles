#/bin/bash

function f_viewImage(){ 
    sxiv -qopt "$@" | \xclip -selection clipboard
    [[ !  -z $(ls *.exiv.*)  ]] && rm -rf *.exiv*
}
