#!/usr/bin/env bash
set -eux -o pipefail

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# in tmux, run
tmux source ~/.config/tmux/tmux.conf
# Press ctrl+b ctrl+shift+i

# add "Defaults !tty_tickets" to sudo visudo
# '$(whoami) ALL=(ALL) NOPASSWD: ALL'
# Add to /etc/grub.d/40_custom

# menuentry "Shutdown" {
# 	echo "System shutting down..."
# 	halt
# }
#
# menuentry "Restart" {
# 	echo "System rebooting..."
# 	reboot
# }
