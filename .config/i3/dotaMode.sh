#!/bin/bash

i3-msg 'workspace " 7:Dota2 "' #The workspace in which Dota is launched
i3-msg mode 'Dota2'

# current_ws=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2) #Get the current workspace
# if [ "$current_ws" == '3' ]
# then
# i3-msg mode '_'
# else
# i3-msg mode 'default'
# fi
