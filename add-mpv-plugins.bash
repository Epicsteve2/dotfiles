#!/usr/bin/env bash
set -eux -o pipefail

wget 'https://raw.githubusercontent.com/occivink/mpv-scripts/master/scripts/crop.lua' --directory-prefix=~/.config/mpv/scripts/
wget 'https://raw.githubusercontent.com/occivink/mpv-scripts/master/script-opts/crop.conf' --directory-prefix=~/.config/mpv/script-opts/

wget 'https://raw.githubusercontent.com/zc62/mpv-scripts/master/autoloop.lua' --directory-prefix=~/.config/mpv/scripts/

wget 'https://raw.githubusercontent.com/Arieleg/mpv-copyTime/master/copyTime.lua' --directory-prefix=~/.config/mpv/scripts/
echo 'mp.add_key_binding("Ctrl+C", "copyTimeSeconds", copyTimeSeconds)' >>~/.config/mpv/scripts/copyTime.lua

wget 'https://raw.githubusercontent.com/mpv-player/mpv/master/TOOLS/lua/autoload.lua' --directory-prefix=~/.config/mpv/scripts/
