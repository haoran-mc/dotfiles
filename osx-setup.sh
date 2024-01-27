#!/bin/bash

########### 1. Download softwares

# https://github.com/nithinbekal/setup-scripts

# install homebrew - this will also install xcode command line tools
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install ctags git htop zsh vim macvim elixir
brew install -q tmux reattach-to-user-namespace

# use cask for installing GUI apps
brew cask install iterm2 sublime-text --cask

# git
git config --global user.name "haoran"
git config --global user.email "haoran.mc@outlook.com"

# configure zsh
touch ~/.env.local
chsh -s /bin/zsh
curl -L http://install.ohmyz.sh | sh

# install RVM
\curl -sSL https://get.rvm.io | bash -s stable
rvm install ruby

# setup node.js
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
nvm install 6.2

# generate ssh keys
mkdir -p ~/.ssh
ssh-keygen -t rsa -C "haoran.mc@outlook.com"

# set up postgresql
brew install postgresql
brew services start postgresql
initdb --locale=C -E UTF-8 /opt/homebrew/var/postgresql
# /opt/homebrew/opt/postgresql@14/bin/createuser -s postgres

# Snipaste WhatPluse
# Tencent Lemon
# vimac -> homerow


########### 2. Think you've already downloaded the softwares.

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


########### 3. Record the data to be migrated

# push repository commit
# rime data


