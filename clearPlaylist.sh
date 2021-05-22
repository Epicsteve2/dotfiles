#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    # echo "Illegal number of parameters" >> "${HOME}/ayaya.txt"
    exit 1
fi

# line=`head -n 1 "${1}/playlist.txt"`
# echo $line >> "${HOME}/ayaya.txt"
# echo $2 >> "${HOME}/ayaya.txt"

# if [[ "$line" = "$2" ]]; then
# 	echo "first line is file!" >> "${HOME}/ayaya.txt"
# fi

#bruh="/mnt/3ADED414DED3C5F3/Anime n Movies/[Judas] Kamisama ni Natta Hi (The Day I Became a God) (Season 1) [1080p][HEVC x265 10bit][Eng-Subs]"

# echo "${2}" > "${HOME}/ayaya.txt"

if [ -f "${1}/playlist.txt" ]; then
	#echo "${1}/playlist.txt exists!!" >> "${HOME}/ayaya.txt"
	sed -i 1d "${1}/playlist.txt"
	# echo ""
fi
# 