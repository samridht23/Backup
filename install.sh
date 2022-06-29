#!bin/bash

yes | sudo pacman -Syu
yes | sudo pacman -S curl 
yes | sudo pacman -S git 
yes | sudo pacman -S terminator 
yes | sudo pacman -S feh 
yes | sudo pacman -S i3 
yes | sudo pacman -S picom 
yes | sudo pacman -S xclip 
yes | sudo pacman -S nodejs 
yes | sudo pacman -S npm

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

cd ~/.config
git clone git clone https://github.com/tobi-wan-kenobi/bumblebee-status.git
mkdir nvim
cd nvim 
git clone https://github.com/samridht23/dotfiles.git
cd dotfiles
mv plugin init.vim coc-settings.json ..
rm -r -f dotfiles
