#!/usr/bin/env bash
DST="${HOME}/CodeMonkey/dotfiles"

if [[ "$#" -ge 1 ]]; then
	if [[ "$#" -ge 2 ]]; then
		>&2 echo "Too many arguments"
		exit 1
	fi

	if [[ "$1" == "purge" ]]; then
		#shopt -s dotglob
		#rm -vrf "${DST}/"*
		echo Purging bad
		exit
	fi

	>&2 echo "Invalid argument [$1]"
	exit 1
fi

# "${HOME}/.config/mpv/scripts/input.confx-special/nautilus-clipboard"
if ! [[ -d "$DST" ]]; then
	mkdir -vp "$DST"
fi

if ! [[ -d "$DST/mpv/scripts" ]]; then
	mkdir -vp "$DST/mpv/scripts"
fi

if ! [[ -d "$DST/mpv/script-opts" ]]; then
	mkdir -vp "$DST/mpv/script-opts"
fi

if ! [[ -d "$DST/config" ]]; then
	mkdir -vp "$DST/config"
fi

if ! [[ -d "$DST/config/Dharkael" ]]; then
	mkdir -vp "$DST/config/Dharkael"
fi

if ! [[ -d "$DST/config/sublime-text-3/Packages/User" ]]; then
	mkdir -vp "$DST/config/sublime-text-3/Packages/User"
fi

cp -v "${HOME}/.config/mpv/mpv.conf" \
"${DST}/mpv/"

cp -v "${HOME}/.config/mpv/input.conf" \
"${DST}/mpv/"

cp -v "${HOME}/.config/mpv/scripts/autoloop.lua" \
"${DST}/mpv/scripts"

cp -v "${HOME}/.config/mpv/scripts/crop.lua" \
"${DST}/mpv/scripts"

cp -v "${HOME}/.config/mpv/script-opts/crop.conf" \
"${DST}/mpv/script-opts/"

cp -v "${HOME}/.config/bakamplayer.ini" \
"${DST}/config"

cp -v "${HOME}/.bashrc" \
"${DST}/bashrc"

cp -v "${HOME}/.inputrc" \
"${DST}/inputrc"

cp -v "${HOME}/.profile" \
"${DST}/profile"

cp -v "${HOME}/.zshrc" \
"${DST}/zshrc"

cp -v "${HOME}/.p10k.zsh" \
"${DST}/p10k.zsh"

cp -v "${HOME}/.bash_functions" \
"${DST}/bash_functions"

cp -v "${HOME}/.config/droidcam" \
"${DST}/config"

cp -v "${HOME}/.config/Dharkael/flameshot.ini" \
"${DST}/config/Dharkael"

cp -v "${HOME}/.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap" \
"${DST}/config/sublime-text-3/Packages/User/"

cp -v "${HOME}/.config/sublime-text-3/Packages/User/Preferences.sublime-settings" \
"${DST}/config/sublime-text-3/Packages/User/"

cp -v "${HOME}/.config/sublime-text-3/Packages/User/Package Control.sublime-settings" \
"${DST}/config/sublime-text-3/Packages/User/"

cp -v "${HOME}/Documents/copy.sh" \
"${DST}"

cp -v "${HOME}/Documents/anime.sh" \
"${DST}"

cp -v "${HOME}/Documents/clearPlaylist.sh" \
"${DST}"

cp -v "${HOME}/Documents/clearPlaylist.lua" \
"${DST}"

cp -v "${HOME}/Videos/videoToGif.sh" \
"${DST}"

cp -v "${HOME}/CodeMonkey/Python/anime.py" \
"${DST}"

cp -v "${HOME}/.config/kitty/kitty.conf" \
"${DST}/kitty"

cp -v "${HOME}/.config/kitty/kitty.conf" \
"${DST}/kitty"

cp -v "${HOME}/.gitconfig" \
"${DST]/gitconfig"
