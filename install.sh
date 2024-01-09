#!/bin/bash

# just download softwares

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
