#!/bin/bash
if [[ "$3" == "XISlaveKeyboard" ]]; then
    echo "Rerunning due to event on '$4'" 
    setxkbmap -option 'grp:switch,grp:alt_space_toggle,caps:escape' -layout us,si -variant ,us
fi