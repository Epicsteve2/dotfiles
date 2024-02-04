#!/bin/bash

set -eu -o pipefail

if [[ -z "$1" ]]; then
	echo >&2 'No argument supplied'
	exit 1
fi

if [[ $(xprop -id "$(xdotool getactivewindow)" WM_CLASS | awk '{print $4}' | sed "s/\"//g") = 'steam_app_658620' ]]; then
	IS_WONDERFUL_EVERYDAY_ACTIVE=true
else
	IS_WONDERFUL_EVERYDAY_ACTIVE=false
fi

case "$1" in
'a')
	if [[ $IS_WONDERFUL_EVERYDAY_ACTIVE == true ]]; then
		eval "$(xdotool getmouselocation --shell)"
		xdotool mousemove 967, 1046
		sleep 0.2
		xdotool click 1
		xdotool mousemove "$X", "$Y"
	else
		xdotool key a
	fi
	;;

'o')
	if [[ $IS_WONDERFUL_EVERYDAY_ACTIVE == true ]]; then
		eval "$(xdotool getmouselocation --shell)"
		xdotool mousemove 1338, 1043
		sleep 0.2
		xdotool click 1
		xdotool mousemove "$X", "$Y"
	else
		xdotool key o
	fi
	;;

*)
	echo >&2 'Not a valid key...'
	exit 1
	;;
esac
