#!/usr/bin/env bash
ANIME='[Reaktor] Serial Experiments Lain - Complete [1080p][x265][10-bit][Dual-Audio]'

PARENTLOCATION="/mnt/3ADED414DED3C5F3/Anime n Movies"
LOCATION="/mnt/3ADED414DED3C5F3/Anime n Movies/${ANIME}"
SCRIPTLOCATION="${HOME}/Documents/clearPlaylist.lua"
THISSCRIPT="${HOME}/Documents/anime.sh"

PINK='\033[1;35m' # Pink color
NC='\033[0m' # No Color

cd "${LOCATION}"
# thunar "${LOCATIOn}"

#echo $(ls --directory -l "${PARENTLOCATION}"/*/)
#FOLDERLIST=`ls -F "${PARENTLOCATION}" | grep /`
#FOLDERLIST=(`ls -F "${PARENTLOCATION}" | grep /`)

changeAnime() {
	echo -e "${PINK}Current Anime: '${ANIME}'${NC}"
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
			FILELIST+=("`basename -- "${FILE}"`")
		fi
	done


	PS3="Choose an anime! "
	select ANIME in "${FILELIST[@]}"; do 
		if [[ -z $ANIME ]]; then
			>&2 echo "Not a valid anime!"
			exit 1
		fi
		sed -i "2s/.*/ANIME='${ANIME}'/" "${THISSCRIPT}"
		"${THISSCRIPT}" "rm" 
		exec "${THISSCRIPT}" 
	done
}

if [[ "$#" -ge 1 ]]; then
	if [[ "$#" -ge 2 ]]; then
		>&2 echo "Too many arguments"
		exit 1
	fi

	if [[ "$1" == "rm" ]]; then
		rm -v "${LOCATION}/watch.sh" "${LOCATION}/playlist.txt" 
		exit
	fi

	if [[ "$1" == "set" ]]; then
		changeAnime
		exit
	fi

	if [[ "$1" == "purge" ]]; then
		find "${PARENTLOCATION}" -name "watch.sh"
		find "${PARENTLOCATION}" -name "watch.sh" -delete
		find "${PARENTLOCATION}" -name "playlist.txt"
		find "${PARENTLOCATION}" -name "playlist.txt" -delete
		exit
	fi

	>&2 echo "Invalid argument [$1]"
	exit 1
fi

if ! [ -f "${LOCATION}/playlist.txt" ]; then # checks if playlist exists
	ls -p | grep -Ev '.sh|.txt|.jpg|/' > "${LOCATION}/playlist.txt" 
	echo -e "Created ${PINK}playlist.txt${NC} at ${LOCATION}\n"
else 
	# can remove this
	EPISODESLEFT=`wc -l "${LOCATION}/playlist.txt" | awk '{print $1}'`
	if [[ ${EPISODESLEFT} -le 1 ]]; then
		changeAnime
		exit
	fi
fi

if ! [[ -f ${LOCATION}/watch.sh ]]; then # checks if watch script exists
	echo "#!/usr/bin/env bash"                           >  "${LOCATION}/watch.sh"
	echo "mpv --script=\"${SCRIPTLOCATION}\" \\"         >> "${LOCATION}/watch.sh"
	echo "    --pause \\"                                >> "${LOCATION}/watch.sh"
	echo "    --screen=1 \\"                             >> "${LOCATION}/watch.sh"
	echo "    --playlist=\"${LOCATION}/playlist.txt\""   >> "${LOCATION}/watch.sh"
  # echo "    --save-position-on-quit \\"                >> "${LOCATION}/watch.sh"
  # echo "    --sub=2 \\"                                >> "${LOCATION}/watch.sh"
	chmod +x "${LOCATION}/watch.sh"
	echo -e "Created ${PINK}watch.sh${NC} at ${LOCATION}/\n"
fi

echo "Options: purge, rm, set, no option!"
echo ""

# --sub=2
#--save-position-on-quit
bash "${LOCATION}/watch.sh"