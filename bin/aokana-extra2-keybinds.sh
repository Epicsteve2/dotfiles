#!/bin/bash

set -eu -o pipefail

if [[ -z "$1" ]]; then
	echo >&2 'No argument supplied'
	exit 1
fi

## Don't need this I guess. Was gonna put this in the arguments of xdotool but i guess that's not needed
# AOKANA_EXTRA2_WINDOW=$(xdotool search --name 'Aokana EXTRA2')
# if [[ -z $AOKANA_EXTRA2_WINDOW ]]; then
# 	echo "Could not find Aokana EXTRA2"
# 	exit 1
# fi

# Bash has NO BOOLEANS BRUH
if [[ $(xprop -id "$(xdotool getactivewindow)" WM_CLASS | awk '{print $4}' | sed "s/\"//g") = 'steam_app_2206340' ]]; then
	IS_AOKANA_EXTRA2_ACTIVE=true
else
	IS_AOKANA_EXTRA2_ACTIVE=false
fi

case "$1" in
'a')
	if [[ $IS_AOKANA_EXTRA2_ACTIVE == true ]]; then
		xdotool mousemove 1682, 809 click 1 mousemove restore
	else
		xdotool key a
	fi
	;;
's')
	if [[ $IS_AOKANA_EXTRA2_ACTIVE == true ]]; then
		xdotool mousemove 1760, 827 click 1 mousemove restore
	else
		xdotool key s
	fi
	;;
'f')
	if [[ $IS_AOKANA_EXTRA2_ACTIVE == true ]]; then
		xdotool mousemove 1683, 858 click 1 mousemove restore
	else
		xdotool key f
	fi
	;;
'l')
	if [[ $IS_AOKANA_EXTRA2_ACTIVE == true ]]; then
		xdotool mousemove 1759, 873 click 1 mousemove restore
	else
		xdotool key l
	fi
	;;

'c')
	if [[ $IS_AOKANA_EXTRA2_ACTIVE == true ]]; then
		xdotool key Return
	else
		xdotool key c
	fi
	;;

'o')
	if [[ $IS_AOKANA_EXTRA2_ACTIVE == true ]]; then
		xdotool mousemove 1687, 985 click 1 mousemove restore
	else
		xdotool key o
	fi
	;;

'v')
	if [[ $IS_AOKANA_EXTRA2_ACTIVE == true ]]; then
		xdotool mousemove 1685, 774 click 1 mousemove restore
	else
		xdotool key v
	fi
	;;

'r')
	if [[ $IS_AOKANA_EXTRA2_ACTIVE == true ]]; then
		xdotool mousemove 1684, 938 click 1 mousemove restore
	else
		xdotool key r
	fi
	;;

't')
	if [[ $IS_AOKANA_EXTRA2_ACTIVE == true ]]; then
		xdotool mousemove 1687, 985 click 1
		sleep 0.2
		xdotool mousemove 1687, 985 click 1
		sleep 0.4
		xdotool click 1
	else
		xdotool key t
	fi
	;;

'space')
	if [[ $IS_AOKANA_EXTRA2_ACTIVE == true ]]; then
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
