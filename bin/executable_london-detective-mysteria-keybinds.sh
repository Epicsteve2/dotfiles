#!/bin/bash

set -eu -o pipefail

if [[ -z "$1" ]]; then
	echo >&2 'No argument supplied'
	exit 1
fi

if [[ $(xprop -id "$(xdotool getactivewindow)" WM_CLASS | awk '{print $4}' | sed "s/\"//g") = 'steam_app_627350' ]]; then
	IS_LONDON_DETECTIVE_MYSTERIA_ACTIVE=true
else
	IS_LONDON_DETECTIVE_MYSTERIA_ACTIVE=false
fi

case "$1" in
'f')
	if [[ $IS_LONDON_DETECTIVE_MYSTERIA_ACTIVE == true ]]; then
		xdotool key F8
	else
		xdotool key f
	fi
	;;

'c')
	if [[ $IS_LONDON_DETECTIVE_MYSTERIA_ACTIVE == true ]]; then
		xdotool key space
	else
		xdotool key c
	fi
	;;

'o')
	if [[ $IS_LONDON_DETECTIVE_MYSTERIA_ACTIVE == true ]]; then
		xdotool key c
	else
		xdotool key o
	fi
	;;

'b')
	if [[ $IS_LONDON_DETECTIVE_MYSTERIA_ACTIVE == true ]]; then
		xdotool key F6
	else
		xdotool key b
	fi
	;;

'n')
	if [[ $IS_LONDON_DETECTIVE_MYSTERIA_ACTIVE == true ]]; then
		xdotool key F7
	else
		xdotool key n
	fi
	;;

'space')
	if [[ $IS_LONDON_DETECTIVE_MYSTERIA_ACTIVE == true ]]; then
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
