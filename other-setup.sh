#!/usr/bin/env bash
set -eux -o pipefail

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
