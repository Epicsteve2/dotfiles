#!/bin/bash

X_OFFSET=1920

set -eu -o pipefail

if [[ -z "$1" ]]; then
	echo >&2 'No argument supplied'
	exit 1
fi

if [[ $(xprop -id "$(xdotool getactivewindow)" WM_CLASS | awk '{print $4}' | sed "s/\"//g") = 'steam_app_1460490' ]]; then
	IS_MAJIKOI_ACTIVE=true
else
	IS_MAJIKOI_ACTIVE=false
fi

case "$1" in
'r')
	if [[ $IS_MAJIKOI_ACTIVE == true ]]; then
		# 2721, 1051
		xdotool mousemove $((X_OFFSET + 801)), 1051 sleep 0.1 mousedown 1 sleep 0.1 mouseup 1 mousemove restore
	else
		xdotool key r
	fi
	;;

'b')
	if [[ $IS_MAJIKOI_ACTIVE == true ]]; then
		# previous 2790, 1053
		xdotool mousemove $((X_OFFSET + 870)), 1053 sleep 0.1 mousedown 1 sleep 0.1 mouseup 1 mousemove restore
	else
		xdotool key b
	fi
	;;

'n')
	if [[ $IS_MAJIKOI_ACTIVE == true ]]; then
		# previous 3074, 1057
		xdotool mousemove $((X_OFFSET + 1154)), 1057 sleep 0.1 mousedown 1 sleep 0.1 mouseup 1 mousemove restore
		# sleep 0.225
		# xdotool click 1
	else
		xdotool key n
	fi
	;;
't')
	if [[ $IS_MAJIKOI_ACTIVE == true ]]; then
		# title 3180, 1055
		xdotool keydown o sleep 0.1 keyup o sleep 0.25 mousemove $((X_OFFSET + 1260)), 1055 sleep 0.125 mousedown 1 sleep 0.1 mouseup 1 mousemove restore
	else
		xdotool key t
	fi
	;;

*)
	echo >&2 'Not a valid key...'
	exit 1
	;;
esac
