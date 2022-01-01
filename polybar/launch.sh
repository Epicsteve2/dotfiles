#!/usr/bin/env bash

killall --quiet polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

# to make sure tray is on primary monitor

MONITOR=$PRIMARY polybar example \
  --config="${HOME}/.config/polybar/config" 2>&1 |
  ts |
  tee --append /tmp/polybar"$monitor".log &
disown

sleep 1

for monitor in $OTHERS; do
  MONITOR=$monitor polybar example \
    --config="${HOME}/.config/polybar/config" 2>&1 |
    ts |
    tee --append /tmp/polybar"$monitor".log &
  disown
done
# for monitor in $(polybar --list-monitors | cut --delimiter ":" --fields 1); do
#   MONITOR=$monitor \
#     polybar example \
#     --reload \
#     --config="${HOME}/.config/polybar/config" 2>&1 |
#     ts |
#     tee --append /tmp/polybar"$monitor".log &
#   disown
# done
