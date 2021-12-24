#!/usr/bin/env sh

# idk why this is needed
sleep 0.2

value="$(xset q | grep -i 'Num Lock' | cut -c 46-47)"

if [ "$value" = "on" ]; then
    output="num lock is on"
else
    output="num lock is off"
fi

notify-send -t 750 "$output"
