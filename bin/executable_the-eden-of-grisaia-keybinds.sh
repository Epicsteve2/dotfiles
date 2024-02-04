#!/bin/bash

X_OFFSET=1920

set -eu -o pipefail

if [[ -z "$1" ]]; then
	echo >&2 'No argument supplied'
	exit 1
fi

if [[ $(xprop -id "$(xdotool getactivewindow)" WM_CLASS | awk '{print $4}' | sed "s/\"//g") = 'steam_app_345630' ]]; then
	IS_THE_EDEN_OF_GRISAIA_ACTIVE=true
else
	IS_THE_EDEN_OF_GRISAIA_ACTIVE=false
fi

case "$1" in
's')
	if [[ $IS_THE_EDEN_OF_GRISAIA_ACTIVE == true ]]; then
		xdotool key Escape
		xdotool mousemove $((X_OFFSET + 612)), 143
		sleep 0.25
		xdotool key Up
		sleep 0.125
		xdotool key Up
		sleep 0.125
		xdotool key Up
		sleep 0.125
		xdotool key Left
		sleep 0.125
		xdotool key Left
		sleep 0.125
		xdotool key Left
		sleep 0.125
		xdotool key Return
		xdotool mousemove $((X_OFFSET + 638)), 50
	else
		xdotool key s
	fi
	;;

'l')
	if [[ $IS_THE_EDEN_OF_GRISAIA_ACTIVE == true ]]; then
		xdotool key Escape
		xdotool mousemove $((X_OFFSET + 612)), 143
		sleep 0.25
		xdotool key Up
		sleep 0.125
		xdotool key Up
		sleep 0.125
		xdotool key Up
		sleep 0.125
		xdotool key Left
		sleep 0.125
		xdotool key Left
		sleep 0.125
		xdotool key Return
		xdotool mousemove $((X_OFFSET + 638)), 50
	else
		xdotool key l
	fi
	;;

'space')
	if [[ $IS_THE_EDEN_OF_GRISAIA_ACTIVE == true ]]; then
		xdotool key Return
	else
		xdotool key space
	fi
	;;

*)
	echo >&2 'Not a valid key...'
	exit 1
	;;
esac
