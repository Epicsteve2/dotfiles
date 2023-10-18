wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.tar.xz --directory-prefix=/tmp
tar xvf /tmp/FiraCode.tar.xz
mkdir ~/.local/share/fonts
mv -v /tmp/FiraCodeNerdFont* ~/.local/share/fonts
fc-cache -f -v
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
