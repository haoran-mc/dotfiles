#!/bin/bash

set -e

source ./scripts/script-funcs.sh

### install softwares
yay -S repgrep fzf
# go nvm nodejs


### dotfiles
__current_status "linking dotfiles"
dotfiles=(.ctags .bashrc .zshrc .gitconfig .xprofile)

for file in ${dotfiles[@]}; do
    __current_status "linking ${file}"
    __link_file ~/dotfiles/$file ~/$file
done


### vim
__current_status "linking vim config"
__link_file ~/dotfiles/vim/.vimrc ~/.vimrc


### neovim
__current_status "linking neovim config"
__link_file ~/dotfiles/nvim ~/.config/nvim
# neovim mason lazy sync


### zsh
__current_status "installing ohmyzsh"
if [ -d ~/.oh-my-zsh ]; then
    __current_status "found ~/.oh-my-zsh - skipping this step"
else
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    __current_status "installing zsh plugins"
    plugins=(autojump zsh-autosuggestions zsh-syntax-highlighting)
    __install_from_repo "${plugins[*]}"
fi


### rime
# __current_status "installing rime"


### i3wm
source ./i3/setup.sh

__link_file ~/dotfiles/ranger ~/.config/ranger


### end here
__current_status "installation successful 🚀"
