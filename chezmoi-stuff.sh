#!/usr/bin/env bash
set -eux -o pipefail

chezmoi git pull -- --autostash --rebase && chezmoi diff
chezmoi apply --dry-run --verbose

chezmoi re-add
