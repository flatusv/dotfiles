#!/bin/bash

fav="~/media/favs.txt" #dest of file containing the songs
new=$fav"New" #temp variable to make sure the file contains no duplicates

touch $new
mpc current >> $fav
awk '!a[$0]++' $fav > $new
cat $new > $fav
rm $new

