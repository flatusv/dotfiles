#!/bin/bash

# select the window
window_selection=$(xprop WM_CLASS)
# get the class information
window_class=$(echo $window_selection | cut -d, -f2- |  tr -d '"')

i3-msg "[class="$window_class"] floating disable"

