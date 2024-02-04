#!/usr/bin/env bash
set -eux -o pipefail

# add FiraCode
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.tar.xz --directory-prefix=/tmp
mkdir /tmp/firacode/
tar xvf /tmp/FiraCode.tar.xz --directory=/tmp/firacode/
mkdir ~/.local/share/fonts
mv -v /tmp/firacode/FiraCodeNerdFont* ~/.local/share/fonts
fc-cache -f -v

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
