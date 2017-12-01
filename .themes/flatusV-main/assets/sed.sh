#!/bin/sh
sed -i \
         -e 's/#170F0D/rgb(0%,0%,0%)/g' \
         -e 's/#acafa9/rgb(100%,100%,100%)/g' \
    -e 's/#170F0D/rgb(50%,0%,0%)/g' \
     -e 's/#1e1e1e/rgb(0%,50%,0%)/g' \
     -e 's/#170F0D/rgb(50%,0%,50%)/g' \
     -e 's/#b9bcb5/rgb(0%,0%,50%)/g' \
	*.svg
