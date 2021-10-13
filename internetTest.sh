#!/usr/bin/env bash
set -e

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
RESETCOLOR=$(tput sgr0)

if [[ -z $1 ]]; then
    echo >&2 "${RED}No argument supplied${RESETCOLOR}"
    exit 1
elif ! command -v ts &> /dev/null; then
    echo >&2 "${YELLOW}ts${RED} could not be found${RESETCOLOR}"
    exit 1
fi

LOG_FILE="${HOME}/wifi-logs/ping$1.log"
echo "Outputting to ${CYAN}${LOG_FILE}${RESETCOLOR}"

# idk why tf this works. Ignores SIGINT...?
trap '' SIGINT

ping "$1" |& \
    while read -r; do
        if [[ $REPLY == "64 bytes from $1"* ]]; then
            # Outputs with color only certain columns 
            <<<"$REPLY" awk '{print $5 " " $7 " " $8}' \
            	| sed --expression "s/ time=/: ${CYAN}/" \
            	    --expression "s/ ms/${RESETCOLOR}ms/" \
            	    --expression "s/icmp_seq=/${RESETCOLOR}Ping $1 #/"
        else
            echo "${RED}${REPLY}${RESETCOLOR}"
        fi
    done \
        | ts \
        | sed --unbuffered "s/^/${GREEN}/" \
        | tee >(sed \
            --unbuffered \
            --regexp-extended \
            --expression 's/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g' \
            --expression 's/\x1b\(B//g' \
            >> "$LOG_FILE")
            # Remove colors before appending to log
