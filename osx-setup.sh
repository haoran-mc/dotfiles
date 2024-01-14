#!/bin/bash

# Think you've already downloaded the softwares.

set -e

source ./scripts/script-funcs.sh

current_status "linking dotfiles"
dotfiles=(.ctags .bashrc .zshrc .gitconfig)

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



