#!/usr/bin/env bash
set -e

RED=$(tput setaf 1)
# GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
# BLUE=$(tput setaf 4)
# MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
# WHITE=$(tput setaf 7) 
RESETCOLOR=$(tput sgr0)

if [ -z "$1" ]; then
    echo >&2 "${RED}No argument supplied${RESETCOLOR}"
    exit 1
fi

if ! command -v ts &> /dev/null; then
    echo >&2 "${YELLOW}ts${RED} could not be found${RESETCOLOR}"
    exit 1
fi

ping $1 |
    while read; do
        if [[ $REPLY == "64 bytes from $1"* ]]; then
            <<<$REPLY awk '{print $5 " " $7 " " $8}' \
            	| sed "s/ time=/: ${CYAN}/" \
            	| sed "s/ ms/${RESETCOLOR}ms/" \
            	| sed "s/icmp_seq=/Ping #/"
        else
            echo "${RED}${REPLY}${RESETCOLOR}"
        fi
    done | ts | tee --append ~/wifi.log
