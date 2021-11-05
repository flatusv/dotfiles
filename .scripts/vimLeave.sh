#!/bin/bash

#add padding
# sed -i "s/x: 0/x: 20/g" ~/.config/alacritty/alacritty.yml
# sed -i "s/y: 0/y: 30/g" ~/.config/alacritty/alacritty.yml

# get the file the config file points to
configFile=$(readlink -f ~/.config/alacritty/alacritty.yml)

#change background color to terminal
sed -i "s/background: '0x161821'/background: '0x0a0b11'/g" $configFile
