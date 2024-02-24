#!/usr/bin/env bash
set -eu -o pipefail

if [[ $# -eq 0 ]]; then
	echo "No argument supplied"
	exit 1
fi

MEGABITS=$(
	ffprobe -i "${1}" -show_entries format=duration -v quiet -of csv="p=0" |
		(printf '199 / ' && cat) |
		bc --mathlib |
		xargs printf %.2f
)

echo "If adding '-ss' or '-to', add to both!!. also need to change the time..."
echo

COMMAND_TO_RUN="ffmpeg -i '$1' -c:v libvpx-vp9 -b:v '${MEGABITS}M' -pass 1 -an -f null /dev/null && ffmpeg -i '$1' -c:v libvpx-vp9 -b:v '${MEGABITS}M' -pass 2 -c:a libopus '${1%.*}.webm'"

bat --language bash --plain --plain <<<"${COMMAND_TO_RUN}"
xclip -sel clip <<<"${COMMAND_TO_RUN}"
