# after source $ZSH/oh-my-zsh.sh

# vi-mode
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
KEYTIMEOUT=3
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# https://gist.github.com/ssebastianj/dd4a42da5eee3304751712dc8aa1dc62
bindkey '^b' backward-char
bindkey '^f' forward-char
bindkey '^w' backward-kill-word
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
# https://youtrack.jetbrains.com/issue/IDEA-180154/Zsh-bindkeys-forward-word-and-backward-word-do-not-work-in-Terminal

# autojump 需要下载

# git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# plugins=(git zsh-autosuggestions)
bindkey '^p' autosuggest-accept

# 需要将源码克隆到 ~/.oh-my-zsh/custom/ 目录下配置才会生效
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# bat,  Dracula, gruvbox-dark
export BAT_THEME="OneHalfDark"
