#!/bin/bash
set -e
source ~/dotfiles/scripts/script-funcs.sh

### install softwares
yay -S --needed repgrep fzf fd tmux vim \
  alacritty lazygit git-delta eza \
  ttf-jetbrains-mono-nerd nerd-fonts-sf-mono
# go nvm nodejs


### dotfiles #########################
__current_status "linking dotfiles"
dotfiles=(.ctags .bashrc .zshrc .gitconfig .xprofile .xinitrc)
for file in ${dotfiles[@]}; do
    __current_status "linking ${file}"
    __link_file ~/dotfiles/$file ~/$file
done

### vim #########################
__current_status "linking vim config"
__link_file ~/dotfiles/vim/.vimrc ~/.vimrc
cp -r ~/dotfiles/vim/colors ~/.vim/colors

### alacritty #########################
__link_file ~/dotfiles/alacritty-linux.toml ~/.config/alacritty/alacritty.toml

### lazygit #########################
__current_status "linking lazygit config"
__link_file ~/dotfiles/lazygit.yml ~/.config/lazygit/config.yml

__current_status "installation successful 🚀"



##########################################
#### fontconfig
# if [ ! -d ~/.config/fontconfig ]; then
#     mkdir ~/.config/fontconfig
# fi
# __link_file ~/dotfiles/.fonts.conf ~/.config/fontconfig/fonts.conf


#### neovim
# __current_status "linking neovim config"
# __link_file ~/dotfiles/nvim ~/.config/nvim
### neovim mason lazy sync

## rime, tmux, i3wm, ranger


##### zsh
# 1. ohmyz.sh, install oh-my-zsh
# 2. git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# 3. git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# 4. git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# 5. git clone --depth=1 https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/you-should-use
#
# 1. cat /etc/shells, chsh -l
# 2. yay -S zsh 
# 3. chsh -s /usr/bin/zsh
