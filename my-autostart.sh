#!/usr/bin/bash

xinput --set-prop 14 'libinput Accel Profile Enabled' 0, 1
xset r rate 180 90

pactl -- set-sink-volume 0 60%

polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar1.log
polybar bar1 2>&1 | tee -a /tmp/polybar1.log &
disown

echo "Bars launched..."
