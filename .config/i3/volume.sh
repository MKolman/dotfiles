SINK=$(pactl list short sinks | grep -o "^\w*\b")
if [ $1 == '0' ]; then
    pactl set-sink-mute $SINK toggle
else
    pactl set-sink-volume $SINK $1
fi
