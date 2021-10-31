#!/bin/bash

# permanently add ssh key 
function f_sshKeychain(){

    #-- SSH
    /usr/bin/keychain -Q -q --nogui ~/.ssh/id_rsa
    [[ -f $HOME/.keychain/$HOSTNAME-sh ]] && source $HOME/.keychain/$HOSTNAME-sh

}
