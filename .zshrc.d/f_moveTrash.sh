#/bin/bash

# -- move files to .Trash, or when "-rf" is set don't do anything at all
function f_moveTrash() {
    if [[ "$1" == "-rf" ]]; then
        rm -rf "${@:2}" 
    elif [[ "$1" == "--" ]]; then 
        echo -e 'ERROR: unalias rm, and run command again!'
    else
        for i in "$@"; do
            cp -r -t ~/.Trash $i && rm -rf $i
        done
    fi
}
