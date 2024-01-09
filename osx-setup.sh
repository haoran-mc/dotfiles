#!/bin/bash

# Think you've already downloaded the softwares.

set -e

function current_status {
    printf "\e[33m⭑\e[0m %s\n" "$1"
}

function link_file {
    local src=$1 dst=$2
    local date_str=$(date +%y%m%d%H%M)

    if [ -h "${dst}" ]; then
        printf "info: removing existing symlink: %s\n\n" ${dst}
        rm ${dst}
    elif [ -f "${dst}" ]; then
        printf "info: backing up existing file: %s\n\n" "${dst}"
        mv ${dst}{,.${date_str}}
    elif [ -d "${dst}" ]; then
        printf "info: backing up existing dir: %s\n\n" "${dst}"
        mv ${dst}{,.${date_str}}
    fi

    mkdir -p "$(dirname "${dst}")"
    ln -sf "${src}" "${dst}"
}

function install_from_repo {
    local apps=$1

    if [[ `uname` == 'Darwin' ]]; then
        for app in ${apps[@]}; do
            brew install $app
        done
    elif [[ `uname` == 'Linux' ]]; then
        for app in ${apps[@]}; do
            sudo yay -S "$1"
        done
    else
        echo "unsupported os"
    fi
}

function install_from_git {
}

current_status "linking dotfiles"
dotfiles=(.ctags .bashrc .zshrc .zshenv .gitconfig)

for file in ${dotfiles[@]}; do
    current_status "linking ${file}"
    rm -f ~/$file
    link_file ~/dotfiles/$file ~/$file
done

current_status "linking vim config"
link_file ~/dotfiles/vim/.vimrc ~/.vimrc

current_status "linking neovim config"
link_file ~/dotfiles/nvim ~/.config/nvim

current_status "installing neovim tools"
install_from_repo (ripgrep fzf)
# mason lazy sync

current_status "installing ohmyzsh"
if [ -d ~/.oh-my-zsh ]; then
    current_status "found ~/.oh-my-zsh - skipping this step"
else
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    current_status "installing zsh plugins"
    plugins=(autojump zsh-autosuggestions zsh-syntax-highlighting)
    install_from_repo "${plugins[*]}"
fi

current_status "installation successful 🚀"



