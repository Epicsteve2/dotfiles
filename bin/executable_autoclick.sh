#!/usr/bin/env bash

# killall autoclick.sh || while xdotool mousedown 1 sleep 25 mouseup 1 sleep 25; do sleep 0.05; done

echo "Starting Script"
for i in {1..250}; do
	xdotool mousedown 1 sleep 0.025 mouseup 1 sleep 0.025
done
echo "Finished Script"
