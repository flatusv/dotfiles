#/bin/bash

function viewPdf(){
    zathura "$1" >/dev/null 2>&1 &
    # exit
}
