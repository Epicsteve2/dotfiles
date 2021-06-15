#!/usr/bin/env bash
if ! command -v dockutil &> /dev/null; then
    echo "dockutil could not be found"
    exit 1
fi

dockutil --remove 'Microsoft Excel'
dockutil --remove 'OneDrive'
dockutil --remove 'Connect Tunnel'
dockutil --remove 'Google Chrome'
dockutil --remove 'Microsoft PowerPoint'
dockutil --remove 'Microsoft Word'