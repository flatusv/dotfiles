#!/bin/sh

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#654a9699'  # default
T='#d9d6cf99'  # text
W='#cd749c50'  # wrong
V='#63b0b099'  # verifying

/usr/bin/i3lock \
--insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--verifcolor=$T        \
--wrongcolor=$T        \
--timecolor=$T        \
--datecolor=$T        \
--layoutcolor=$T      \
--keyhlcolor=$W       \
--bshlcolor=$W        \
\
--screen 1            \
--blur 1              \
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%a %d-%b-%Y" \
# --keylayout 2         \

# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
--timefont="Ubuntu Mono"
--datefont="Ubuntu Mono"
# etc
