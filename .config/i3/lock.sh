#!/bin/bash
# sh $HOME/.config/i3/individual_scrot.sh
# convert /tmp/head_0.png -scale 10% -scale 1000% /tmp/head_0.png
# [[ -f /home/maks/Dropbox/Photos/lock.png ]] && convert /tmp/head_0.png /home/maks/Dropbox/Photos/lock.png -gravity center -composite -matte /tmp/head_0.png
# if [ -e /tmp/head_1.png ]; then
#   convert /tmp/head_1.png -scale 10% -scale 1000% /tmp/head_1.png
#   [[ -f /home/maks/Dropbox/Photos/lock.png ]] && convert /tmp/head_1.png /home/maks/Dropbox/Photos/lock.png -gravity center -composite -matte /tmp/head_1.png
#   convert /tmp/head_0.png /tmp/head_1.png +append /tmp/screen.png
# else
#   mv /tmp/head_0.png /tmp/screen.png
# fi
# dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
# i3lock -i /tmp/screen.png

scrot /tmp/screen.png
convert /tmp/screen.png -scale 5% -scale 2000% /tmp/screen.png
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
i3lock -i /tmp/screen.png
rm /tmp/screen.png
