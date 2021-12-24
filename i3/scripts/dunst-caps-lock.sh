#!/usr/bin/env sh

# idk why this is needed
sleep 0.2

value="$(xset q | grep -i 'caps' | cut -c 22-23)"

if [ "$value" = "on" ]; then
    output="caps lock is on"
else
    output="caps lock is off"
fi

notify-send -t 750 "$output"

