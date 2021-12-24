#!/usr/bin/env bash

killall --quiet polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | ts | tee --append /tmp/polybar.log #/tmp/polybar2.log
for monitor in $(polybar --list-monitors | cut --delimiter ":" --fields 1); do
  MONITOR=$monitor polybar main --config ~/.config/polybar/config 2>&1 | ts | tee --append /tmp/polybar.log & disown
done

# polybar main 2>&1 | ts | tee /tmp/polybar.log & disown

# polybar main --config | ts | tee --append /tmp/polybar.log & disown