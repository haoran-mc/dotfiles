#!/bin/bash
# https://github.com/nithinbekal/setup-scripts
set -e
source ./scripts/func-util.sh
source ./scripts/proxy.sh

### origin commands #########################
origin_commands=(vim git zsh)
__current_status "check origin commands..."
for cmd in "${origin_commands[@]}"; do
    __current_status "check command: ${cmd}"
    if ! command -v ${cmd} >/dev/null 2>&1; then
        echo "install ${cmd} first!" >&2
        exit 1
    fi
done

### must-have tools #########################
__current_status "install must-have tools..."
must_have_tools=(htop ripgrep fzf fd
    tmux alacritty lazygit git-delta eza
    bat gping tldr fontconfig)
for tool in "${must_have_tools[@]}"; do
    __current_status "install tool: ${tool}"
    if ! command -v ${tool} >/dev/null 2>&1; then
        sleep 3
        brew install ${tool}
    fi
done

### base font #########################
__current_status "install base font: SFMono-Nerd-Font-Ligaturized"
if ! fc-list | grep "LigaSFMonoNerdFont" >/dev/null 2>&1; then
    sleep 3
    brew tap shaunsingh/SFMono-Nerd-Font-Ligaturized
    brew install --cask font-sf-mono-nerd-font-ligaturized
fi

### zsh #########################
__current_status "install oh-my-zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone --depth=1 https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/you-should-use
fi

### link files #########################
__current_status "linking dotfiles"
dotfiles=(.ctags .bashrc .zshrc .gitconfig)
for file in ${dotfiles[@]}; do
    __current_status "linking ${file}"
    __link_file ~/dotfiles/$file ~/$file
done

# alacritty
__current_status "linking alacritty"
__link_file ~/dotfiles/alacritty-osx.toml ~/.config/alacritty/alacritty.toml

# vim
__current_status "linking vim"
__link_file ~/dotfiles/vim/.vimrc ~/.vimrc
__link_file ~/dotfiles/vim/colors ~/.vim/colors

# nvim
__current_status "linking neovim"
__link_file ~/dotfiles/nvim ~/.config/nvim

# lazygit
__current_status "linking lazygit"
__link_file ~/dotfiles/lazygit.yml ~/.config/lazygit/config.yml

### link files #########################
source ./scripts/setup-home.sh

__current_status "successfully install 🚀"


printf "\n"
printf "1. now you can source ~/.zshrc\n"
printf "2. diff ~/.zshrc and ~/.zshrc.pre-oh-my-zsh\n"
printf "3. sync vim, nvim plugins\n"
printf "4. tmux and reattach-to-user-namespace\n"


##########################################
##### Fonts
# brew tap homebrew/cask-fonts
# brew install font-ubuntu
# brew install font-fontawesome
# brew install font-hack-nerd-font
# brew install font-fira-code-nerd-font


##########################################
##### tmux
# brew install -q tmux reattach-to-user-namespace

##### setup RVM
# curl -sSL https://get.rvm.io | bash -s stable
# rvm install ruby

##### setup node.js
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
# nvm install 6.2

##### setup postgresql
# brew install postgresql
# brew services start postgresql
# initdb --locale=C -E UTF-8 /opt/homebrew/var/postgresql
# /opt/homebrew/opt/postgresql@14/bin/createuser -s postgres
