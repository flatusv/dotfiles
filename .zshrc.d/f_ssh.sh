#!/bin/bash

# permanently add ssh key 
function f_ssh(){

    user=$(whoami)

    #-- SSH
    /usr/bin/keychain -Q -q --nogui ~/.ssh/id_rsa
    [[ -f $HOME/.keychain/$HOSTNAME-sh ]] && source $HOME/.keychain/$HOSTNAME-sh

    if [ "$user" = "geeray" ]; then
      ssh yymirr@mythrill
    else
      ssh geeray@mythrill
    fi


}
