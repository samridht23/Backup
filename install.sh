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


function pause(){
    read -p "press any key to continue" && echo -e "\n"
    echo "hi" && echo $?
}

Red='\033[0;31m'
Green='\033[0;32m'
Nc='\033[0m' 
Cyan='\033[0;36m'

installed=()
notinstalled=()

for pkg in "${pkg[@]}"; do
    echo -e "${Cyan}INSTALLING:${Nc} ${Green}${pkg}${Nc}"
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

