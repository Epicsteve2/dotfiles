#!/bin/bash

set -eu -o pipefail

if [[ -z "$1" ]]; then
	echo >&2 'No argument supplied'
	exit 1
fi

if [[ $(xprop -id "$(xdotool getactivewindow)" WM_CLASS | awk '{print $4}' | sed "s/\"//g") = 'steam_app_345610' ]]; then
	IS_THE_FRUIT_OF_GRISAIA_ACTIVE=true
else
	IS_THE_FRUIT_OF_GRISAIA_ACTIVE=false
fi

case "$1" in
'a')
	if [[ $IS_THE_FRUIT_OF_GRISAIA_ACTIVE == true ]]; then
		xdotool key a
		sleep 0.1
		xdotool key a
		sleep 0.1
		xdotool key a
		sleep 0.1
		xdotool key a
		sleep 0.1
		xdotool key a
		sleep 0.1
		xdotool key a
	else
		xdotool key a
	fi
	;;

's')
	if [[ $IS_THE_FRUIT_OF_GRISAIA_ACTIVE == true ]]; then
		xdotool key Escape
		xdotool mousemove 612, 143
		sleep 0.4
		xdotool key Right
		sleep 0.1
		xdotool key Return
		xdotool mousemove 638, 50
	else
		xdotool key s
	fi
	;;

'l')
	if [[ $IS_THE_FRUIT_OF_GRISAIA_ACTIVE == true ]]; then
		xdotool key Escape
		xdotool mousemove 612, 143
		sleep 0.4
		xdotool key Right
		sleep 0.1
		xdotool key Right
		sleep 0.1
		xdotool key Return
		xdotool mousemove 638, 50
	else
		xdotool key l
	fi
	;;

'space')
	if [[ $IS_THE_FRUIT_OF_GRISAIA_ACTIVE == true ]]; then
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
