#!/usr/bin/env bash
set -eux -o pipefail
chezmoi init
chezmoi --source ~/code-monkey/dotfiles init # when first starting i think

chezmoi git pull -- --autostash --rebase && chezmoi diff
chezmoi apply --dry-run --verbose

chezmoi re-add

chezmoi add ~/.config/systemd/user/kanata.service
