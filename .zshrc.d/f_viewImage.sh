#/bin/bash

function f_viewImage(){ 
    case "$@" in
        *.svg)  inkview "$@";;
        *)      # for any other regular image file
                sxiv -qopt "$@" | \xclip -selection clipboard
                [[ !  -z $(ls *.exiv.*)  ]] && rm -rf *.exiv*
                ;;
    esac
}
