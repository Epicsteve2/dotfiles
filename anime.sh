#!/usr/bin/env bash
ANIME='[Reaktor] Legend of the Galactic Heroes - Ginga Eiyuu Densetsu [720p][x265][10-bit]'

PARENTLOCATION="/mnt/3ADED414DED3C5F3/Anime n Movies"
PARENTLOCATIONREAL="/mnt/3ADED414DED3C5F3/Anime n Movies"
LOCATION="${PARENTLOCATIONREAL}/${ANIME}"
# PARENTLOCATION="${HOME}/Videos"
# PARENTLOCATIONREAL="${HOME}/Videos"
# LOCATION="${HOME}/Videos/${ANIME}"
SCRIPTLOCATION="${HOME}/Documents/clearPlaylist.lua"
THISSCRIPT="${HOME}/Documents/anime.sh"
COPYLOCATION="${HOME}/Documents/copy.sh"

PINK='\033[1;35m' # Pink color
NC='\033[0m' # No Color

cd "${LOCATION}"
# echo $LOCATION

#echo $(ls --directory -l "${PARENTLOCATION}"/*/)
#FOLDERLIST=`ls -F "${PARENTLOCATION}" | grep /`
#FOLDERLIST=(`ls -F "${PARENTLOCATION}" | grep /`)
watchAnime() {
	NUMANIME=`ls -p "${LOCATION}" | grep -Ev '/|\.sh|\.txt' | wc -l`
	if [[ $NUMANIME == 0 ]]; then
		PARENTLOCATION="${PARENTLOCATION}/${ANIME}"
		echo ""
		echo "No anime found..."
		#echo $PARENTLOCATION
		changeAnime
	else
		echo ""
	fi

	if ! [ -f "${LOCATION}/playlist.txt" ]; then # checks if playlist exists
		# echo "$LOCATION"
		# pwd
		# echo ""
		# echo ""
		# ls -p "${LOCATION}"
		# echo ""
		# ls -p "${LOCATION}" | grep -Ev '.sh|.txt|.jpg|/' 
		# echo ""
		ls -p "${LOCATION}" | grep -Ev '\.sh|\.txt|\.jpg|/' > "${LOCATION}/playlist.txt" 
		echo -e "Created ${PINK}playlist.txt${NC} at ${LOCATION}\n"
	# else 
	# 	# can remove this
	# 	EPISODESLEFT=`wc -l "${LOCATION}/playlist.txt" | awk '{print $1}'`
	# 	if [[ ${EPISODESLEFT} -le 1 ]]; then
	# 		changeAnime
	# 		sleep 3
	# 		exit
	# 	fi
	fi

	if ! [[ -f ${LOCATION}/watch.sh ]]; then # checks if watch script exists
		echo "#!/usr/bin/env bash"                           >  "${LOCATION}/watch.sh"
		echo "mpv --script=\"${SCRIPTLOCATION}\" \\"         >> "${LOCATION}/watch.sh"
		echo "    --pause \\"                                >> "${LOCATION}/watch.sh"
		echo "    --screen=1 \\"                             >> "${LOCATION}/watch.sh"
		echo "    --playlist=\"${LOCATION}/playlist.txt\""   >> "${LOCATION}/watch.sh"
		#echo "    --save-position-on-quit \\"                >> "${LOCATION}/watch.sh"
		#echo "    --sub=2 \\"                                >> "${LOCATION}/watch.sh"
		chmod +x "${LOCATION}/watch.sh"
		echo -e "Created ${PINK}watch.sh${NC} at ${LOCATION}/\n"
	fi

	# echo ""
	# echo "Options: purge, rm, set, no option!"

	# --sub=2
	#--save-position-on-quit
	#thunar "${LOCATION}"
	bash "${LOCATION}/watch.sh"
}

changeAnime() {
	#echo -e "${PINK}Current Anime: '${ANIME}'${NC}"
	# I have no clue what this does
	shopt -s nullglob
	shopt -s dotglob

	#FILELIST=(/mnt/3ADED414DED3C5F3/Anime\ n\ Movies/*)
	#FILELIST=("$PARENTLOCATION/*")
	FILELIST=()
	# for FILE in "${FILELIST[@]}"; do
	# 	if [[ -d  "$FILE" ]]; then
	# 		NEWFILELIST+=("`basename -- "${FILE}"`")
	# 	fi
	# done

	# for file in "${NEWFILELIST[@]}"; do
	# 	echo $file
	# done

	for FILE in "$PARENTLOCATION"/*; do
		if [[ -d  "$FILE" ]]; then
			# echo "$FILE"
			# echo "${FILE#"${HOME}/Videos/"}"
			# echo ""
			# FILELIST+=("`basename -- "${FILE}"`")
			FILE="${FILE#"${PARENTLOCATIONREAL}/"}"
			FILELIST+=("${FILE}")
		fi
	done


	PS3="Choose an anime! "
	select ANIME in "${FILELIST[@]}"; do 
		if [[ -z $ANIME ]]; then
			>&2 echo "Not a valid anime!"
			sleep 3
			exit 1
		fi

		sed -i "2s:.*:ANIME='${ANIME}':" "${THISSCRIPT}"
		#"${THISSCRIPT}" "rm" 
		exec "${THISSCRIPT}" "watch"
	done
}

if [[ "$#" -ge 1 ]]; then
	if [[ "$#" -ge 2 ]]; then
		>&2 echo "Too many arguments"
		sleep 3
		exit 1
	elif [[ "$1" == "rm" ]]; then
		rm -v "${LOCATION}/watch.sh" "${LOCATION}/playlist.txt" 
		sleep 3
		exit
	elif [[ "$1" == "set" ]]; then
		changeAnime
		sleep 3
		exit
	elif [[ "$1" == "purge" ]]; then
		echo -e "${PINK}Purging...${NC}"
		find "${PARENTLOCATION}" -name "watch.sh"
		find "${PARENTLOCATION}" -name "watch.sh" -delete
		find "${PARENTLOCATION}" -name "playlist.sh"
		find "${PARENTLOCATION}" -name "playlist.sh" -delete
		find "${PARENTLOCATION}" -name "playlist.txt"
		find "${PARENTLOCATION}" -name "playlist.txt" -delete
		sleep 3
		exit
	elif [[ "$1" == "watch" ]]; then
		watchAnime
		exit
	fi

	>&2 echo "Invalid argument [$1]"
	exit 1
fi

echo -e "${PINK}Current Anime: '${ANIME}'${NC}"
echo "[Enter]: watch"
echo "    [1]: set"
echo "    [2]: rm"
echo "    [3]: purge"
echo "    [4]: copy"
#echo "    [0]: exit"
echo ""
printf "Choose an option: "
read INPUT
# if [[ -z $INPUT ]]; then
# 	watchAnime
# fi
# if [[ $INPUT -eq "0" ]]; then
# 	echo "zerp"
# 	exit
# fi
if [[ $INPUT -eq 1 ]]; then
	changeAnime
elif [[ $INPUT -eq 2 ]]; then
	exec "${THISSCRIPT}" "rm" 
elif [[ $INPUT -eq 3 ]]; then
	exec "${THISSCRIPT}" "purge"
elif [[ $INPUT -eq 4 ]]; then
	echo -e "${PINK}Copying...${NC}"
	"${COPYLOCATION}"
	sleep 3
	exit
fi

watchAnime