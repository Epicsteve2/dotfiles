#!/usr/bin/env bash
clear -x
set -eu

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
RESETCOLOR=$(tput sgr0)

# # Also...
# while IFS=':' read -ra COLUMNS; do
# ...
# done < <(<zypper-search-output.txt sed '1,3d' | sed '/:/!d') |

# Remove first 3 lines | remove anything wihtout ':' | split words by ':'
zypper --quiet --table-style=10 search --type=package |
    sed '1,3d' |
    sed '/:/!d' |
    while IFS=':' read -ra COLUMNS; do
        # trims trailing and leading whitespace
        INSTALLED=$(awk '{$1=$1};1' <<<"${COLUMNS[0]}")
        PACKAGE=$(awk '{$1=$1};1' <<<"${COLUMNS[1]}")
        DESCRIPTION=$(awk '{$1=$1};1' <<<"${COLUMNS[2]}")

        OUTPUT="$GREEN${PACKAGE}$RESETCOLOR"
        if [[ -n $INSTALLED ]]; then
            OUTPUT+="*$INSTALLED"
        fi
        OUTPUT+=" - $DESCRIPTION"
        echo "$OUTPUT"
    done |
    # # --preview...
    # sed: Removes the *character at the end of the package
    # awk: print first word
    # sed: Removes the *character at the end of the package
    fzf -e +s --multi --ansi --bind='Ctrl-X:toggle-preview' \
        --inline-info \
        --header='Tab to select multiple packages, Ctrl-X to close preview' \
        --preview="sed 's/\(\*.\)//g' <<<'{1}' | xargs -- zypper --quiet --table-style=1 info" |
            awk '{print $1;}' |
            sed 's/\(\*.\)//g' |
            xargs --no-run-if-empty --open-tty -- sudo zypper install

