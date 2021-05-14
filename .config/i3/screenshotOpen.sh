#/bin/bash

tmpfile=$(mktemp -u /tmp/shot_XXXXXX.png)

scrot -s $tmpfile 
sxiv "$tmpfile" 


