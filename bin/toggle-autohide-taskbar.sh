#!/usr/bin/env bash
# Show/hide panel script
PANEL=0

if [ "$(qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript 'print(JSON.stringify(panels()['$PANEL'], null, 4))' | awk 'NR==87 {print $2}' | wc -c)" -eq 7 ]; then
	qdbus org.kde.plasmashell /PlasmaShell evaluateScript "p = panelById(panelIds[$PANEL]); p.hiding = 'autohide';"
elif [ "$(qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript 'print(JSON.stringify(panels()['$PANEL'], null, 4))' | awk 'NR==87 {print $2}' | wc -c)" -eq 11 ]; then
	qdbus org.kde.plasmashell /PlasmaShell evaluateScript "p = panelById(panelIds[$PANEL]); p.hiding = 'none';"
fi
