#!/bin/bash
max_volume=$1
current_volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(($SINK + 1)) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
desired_volume=$current_volume+10
if (($desired_volume <= $max_volume)); then
	pactl set-sink-volume @DEFAULT_SINK@ +10%
elif (($current_volume != $max_volume)); then
	a=$($max_volume_pc - $current_volume_pc)
	pactl set-sink-volume @DEFAULT_SINK@ +$a%
fi
