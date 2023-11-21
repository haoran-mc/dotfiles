#!/bin/bash

# install homebrew - this will also install xcode command line tools
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install ack ctags git imagemagick mongodb htop zsh vim macvim elixir
brew install tmux reattach-to-user-namespace

# use cask for installing GUI apps
brew install caskroom/cask/brew-cask
brew cask install dropbox iterm2 seil sublime-text

# git
git config --global user.name "haoran"
git config --global user.email "haoran.mc@outlook.com"

# mongodb
mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

# configure zsh
touch ~/.env.local
chsh -s /bin/zsh
curl -L http://install.ohmyz.sh | sh

# configure vim
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
mkdir -p ~/.tmp

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
initdb /usr/local/var/postgres
