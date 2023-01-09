# vdesk noswitch:true on:2 run:cmd /Q /C START /MAX /D "C:\Users\Stephen\CodeMonkey\dotfiles-private" "C:\Users\Stephen\scoop\apps\neovide\current\neovide.exe"

vdesk on:3 run:cmd /Q /C START /MAX /D "C:\Users\Stephen\CodeMonkey\dotfiles-private" "C:\Users\Stephen\scoop\apps\neovide\current\neovide.exe"

vdesk on:3 run:wt --window 0 new-tab -p "bottom" --title "bottom"
