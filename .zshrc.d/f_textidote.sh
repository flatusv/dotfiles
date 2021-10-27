#/bin/bash

function f_textidote(){ 


    # uses textidote package

    # check for grammer
    textidote --check de --output html "$@" >| report.html

    path=$(readlink -f report.html)
    /usr/bin/firefox "$path"
}
