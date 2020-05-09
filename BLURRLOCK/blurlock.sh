#!/bin/sh
#Find all your wallpapers
DIR="/usr/share/backgrounds/*"

#Select wallpaper at random
SCREEN=$(ls $DIR/*.jpg | shuf -n1)

# Convert wallpaper to blurred picture and put it in the i3lock dir
convert -resize $(xdpyinfo | grep dimensions | cut -d\  -f7 | cut -dx -f1) $SCREEN -blur 0x4 /home/$USER/.cache/i3lock/blurlock.png &&\

#Use the blurred picture in the lock screen
i3lock -i /home/$USER/.cache/i3lock/blurlock.png

#After unlock remove the blurred picture
#rm /home/$USER/.cache/i3lock/blurlock.png

