#!/usr/bin/env bash
# Terminate already running bar instances
killall -q polybar
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# Launch Polybar
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        echo $m
        MONITOR=$m polybar --reload example &
        echo $MONITOR
    done
else
    polybar --reload example &
fi

