#!/usr/bin/env bash
CURRENT_ANIME='/mnt/3ADED414DED3C5F3/Anime n Movies/Natsume Yuujinchou Complete Batch/Natsume Yuujinchou Go'

clear -x
set -e

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
RESETCOLOR=$(tput sgr0)

ANIME_LOCATION="/mnt/3ADED414DED3C5F3/Anime n Movies"
THIS_SCRIPT='/home/stephen/CodeMonkey/bashTest/betterAnime.sh'
LUA_SCRIPT='/home/stephen/CodeMonkey/bashTest/clearPlaylist.lua'


chooseFromList() {
    for (( i=1; i<=${#}-1; i++ )) do
        echo "${CYAN}[   ${i}   ]${RESETCOLOR} $(eval echo \"\$\{${i}\}\")"
    done
    echo "${CYAN}[ Enter ]${RESETCOLOR} $(eval echo \$${#})"
    read -p "${YELLOW}Enter a choice: ${RESETCOLOR}" -n 1 -r
    echo
}
export -f chooseFromList

setAnime() {
    # find "${ANIME_LOCATION}" -maxdepth 1 -type d | sort | column | less --chop-long-lines
    cd "${ANIME_LOCATION}"

    ANIME_LIST=$(ls --directory */ | sort | sed 's/\/$//') #| column | less --chop-long-lines
    COUNTER=1
    while read -r; do
        echo "${CYAN}[   ${COUNTER}   ]${RESETCOLOR} ${REPLY}"
        let COUNTER++
    done <<<$ANIME_LIST #| \
    # fzf --ansi --exact
    # exit
    echo "${CYAN}[        ]${RESETCOLOR} Exit"
    read -p "${YELLOW}Enter a choice: ${RESETCOLOR}" -r
    if [[ -z $REPLY ]]; then
        exit
    elif ! [[ $REPLY =~ ^[0-9]+$ ]] || ! (( REPLY >= 1 && REPLY <= $(wc --lines <<<$ANIME_LIST))); then
        >&2 echo "${RED}Invalid input${RESETCOLOR}"
	    exit 1
    fi
    
    echo
    ANIME=$(sed <<<$ANIME_LIST --quiet "${REPLY}p")
    echo "Anime chosen: $GREEN$ANIME$RESETCOLOR"

    NUM_EPISODES=$(ls --indicator-style=slash "$ANIME" | grep --invert-match "/" | wc --lines)
    ls --indicator-style=slash -1 "$ANIME"
    echo "Number of episodes found: $GREEN$NUM_EPISODES$RESETCOLOR"

    if (( NUM_EPISODES == 0 )); then
        echo
        ANIME_LOCATION+="/${ANIME}" setAnime
        return
    fi

    CURRENT_ANIME="${ANIME_LOCATION}/${ANIME}"

    sed --in-place "2s|.*|CURRENT_ANIME='${CURRENT_ANIME}'|" "${THIS_SCRIPT}"

    if ! [ -f "${ANIME_LOCATION}/${ANIME}/playlist.txt" ]; then # checks if playlist exists
		ls --indicator-style=slash "${CURRENT_ANIME}" | grep --extended-regexp --invert-match '\.txt|\.jpg|/' > "${CURRENT_ANIME}/playlist.txt" 
		echo -e "Created ${PINK}playlist.txt${NC} at ${CURRENT_ANIME}\n"
	fi
}

echo "Current anime:"
echo "${GREEN}$(basename "${CURRENT_ANIME}")${RESETCOLOR}"

while true; do
    chooseFromList "set" "rm" "purge" "copy" "watch"

    case $REPLY in
        1)  setAnime;;
        2)  rm --verbose "${CURRENT_ANIME}/playlist.txt" || true;; #echo >&2 "$YELLOW${CURRENT_ANIME}/playlist.txt$RED doesn't exist $RESETCOLOR";;
        3)  find "${ANIME_LOCATION}" -name "playlist.txt" -delete -print;; #-exec rm -vf "{}" \;;;
        4)  mkdir --parents ~/copy-test/
            find "${ANIME_LOCATION}" -type f -name '*.jpg' \
                | xargs \
                    --max-args=1 \
                    --replace={} \
                    -- cp --verbose "{}" ~/copy-test/;;
        q)  exit;;
        *)  cd "$CURRENT_ANIME"
            mpv --script="$LUA_SCRIPT"\
		        --pause \
		        --screen=1 \
		        --playlist="${CURRENT_ANIME}/playlist.txt"
            exit;;
    esac
    echo
done