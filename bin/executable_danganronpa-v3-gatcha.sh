#!/bin/bash

set -eu -o pipefail

NUM_OF_ITERATIONS=250
DANGANRONPA_WINDOW=$(xdotool search --name 'Danganronpa V3: Killing Harmony')
if [[ -z $DANGANRONPA_WINDOW ]]; then
  echo "Could not find Danganronpa V3"
  exit 1
fi

echo "Danganronpa V3 window ID is: $DANGANRONPA_WINDOW"

for i in {5..1}; do 
  echo "Starting script in $i seconds..."
  sleep 1
done

echo "Running for $NUM_OF_ITERATIONS iterations"
for ((i=1; i<=NUM_OF_ITERATIONS; i++)); do
  echo "Interation #$i"
  xdotool keydown --window="$DANGANRONPA_WINDOW" --delay=250 Up keyup --window="$DANGANRONPA_WINDOW" Up 
  sleep 0.5
  xdotool keydown --window="$DANGANRONPA_WINDOW" --delay=250 Return keyup --window="$DANGANRONPA_WINDOW" Return 
  sleep 4 # This is with no extra
  xdotool keydown --window="$DANGANRONPA_WINDOW" --delay=250 Return keyup --window="$DANGANRONPA_WINDOW" Return 
  sleep 0.5
done
