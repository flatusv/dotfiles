#!/bin/bash

dunstify -r 111 "Screen capture pending" "press C-r to toggle screen recording" 
simplescreenrecorder   --no-systray  --start-hidden && dunstify -r 111 "Success" "Video located at ~/media/screenshots/recorded" 

