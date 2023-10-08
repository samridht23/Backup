#!bin/bash

pkg=(
    'git'
    'git'
    'curl'
    'xclip'
    'dmenu'
    'ripgrep'
    'wget'
    'terminator'
    'neovim'
    'jq'
    'htop'
    'feh'
    'neofetch'
    'openssh'
    'vlc'
    'zsh'
    'zsh-completions'
    'thunar'
    'picom'
    'rofi'
    'nodejs'
    'npm'
    'yarn'
    'typescript'
    'typescript-language-server'
    'prettier'
    'go'
    'gopls'
    'lua'
    'lua-language-server'
    'stylua'
    'gcc'
    'clang'
    'cmake'
    'astyle'
    'python'
    'pyright'
    'postgresql'
    'transmission-cli'
    'firefox'
    "flameshot"
    "i3"
)
sudo pacman -Syu
sudo pacman -Syyu

function pause(){
    read -p "Press any key to continue" && echo -e "\n"
}
Red='\033[0;31m'
Green='\033[0;32m'
Nc='\033[0m' 
Cyan='\033[0;36m'

installed=()
notinstalled=()

for pkg in "${pkg[@]}"; do
    echo -e "${Cyan}Installing:${Nc} ${Green}${pkg}${Nc}"
    sudo pacman -S "$pkg" --noconfirm
    status=$?
    if test $status != 0 
    then
        notinstalled+=(${pkg})
    else
        installed+=(${pkg})
    fi
done

for pkg in "${pkg[@]}";do
    status=true
    for j in "${notinstalled[@]}";do
        if test ${j} == ${pkg}
        then
            status=false
        fi
    done
    if test $status == true
    then
        printf "${Cyan}%40s${Nc} ${Green}%10s${Nc}\n" $pkg "Installed"
    else 
        printf "${Cyan}%40s${Nc} ${Red}%10s${Nc}\n" $pkg "Error"
    fi
done
