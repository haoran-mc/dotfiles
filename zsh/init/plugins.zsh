# brew install autojump

if [ "$(uname)" "==" "Darwin" ]
then
    [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
elif [ "$(uname)" "==" "Linux" ]
then
    [[ -s /home/haoran/.autojump/etc/profile.d/autojump.sh ]] && source /home/haoran/.autojump/etc/profile.d/autojump.sh
fi

# git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# plugins=(git zsh-autosuggestions)
bindkey '^p' autosuggest-accept

# bat,  Dracula, gruvbox-dark
export BAT_THEME="OneHalfDark"


# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
