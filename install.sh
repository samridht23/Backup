#!bin/bash

pkg=(
    'git'
    'git'
    'curl'
    'xclip'
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
    'newsboat'
    'guake'
    'discord'
    'exfat-utils'
    'gparted'
    'ntfs-3g'
    'parted'
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
    'chromium'
    'firefox'
    'lollypop'
    "flameshot"
    "i3"
)
aur_pkg=(
    "https://aur.archlinux.org/google-chrome.git"
    "https://aur.archlinux.org/postman-bin.git"
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
# ohmyzsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# neovim config
git clone https://github.com/samridht23/nvim.git ${HOME}/.config

mkdir ${HOME}/apps
mkdir ${HOME}/Downloads/fonts
cd ${HOME}/apps
for val in "${aur_pkg[@]}";do
    git clone "$val"
done
cd

wget -P ${HOME}/Downloads/fonts "https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip"
wget -P ${HOME}/Downloads/fonts "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf"

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

