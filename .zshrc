# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# #####################################################
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN:$GOROOT/bin
export GO111MODULE=on
export GOPROXY=https://goproxy.io,direct
# export GOPROXY=https://goproxy.cn

# python
export PYTHONPATH=/usr/bin/python3
export PYENV_ROOT=/Users/haoran/.pyenv

# java
export JAVA_HOME=/usr/local/java/jdk1.8.0_201
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$JAVA_HOME/bin:$PATH

# lua
export LUA_PATH="./?.lua;;"

# nvim
export PATH=$PATH:/usr/local/nvim-macos/bin

# 安装 emacs 时，需要 pyenv 依赖
export PATH="${HOME}/.pyenv/shims:$PATH"

if [ -f ~/servicewall/secret.zsh ]
then
	source ~/servicewall/secret.zsh
fi

export PATH=$PATH:/home/haoran/.local/bin

# #####################################################
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Set list of themes to pick from when loading at random
# ZSH_THEME="robbyrussell"
# ZSH_THEME="jonathan"
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="fino-time"
# ZSH_THEME="mikeh"
# ZSH_THEME="muse"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="gallois"
# ZSH_THEME="juanghurtado"
# ZSH_THEME="agnoster"
# ZSH_THEME="kolo"
# ZSH_THEME="miloshadzic"
# ZSH_THEME="nanotech"  # **
# ZSH_THEME="rkj-repos"
# ZSH_THEME="blinks"
# ZSH_THEME="bureau"
# ZSH_THEME="arrow"
# ZSH_THEME="avit"
# ZSH_THEME="bira"
# ZSH_THEME="blinks"
# ZSH_THEME="crunch"
# ZSH_THEME="fox"
# ZSH_THEME="funky"
# ZSH_THEME="sonicradish"
# ZSH_THEME="xiong-chiamiov"

# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# brew install pfetch
# brew install neofetch
# curl zh-cn.wttr.in/beijing

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# #####################################################
undelfile()
{
    mv -i ~/.Trash/$@ ./
}

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"
setopt HIST_IGNORE_DUPS

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    vi-mode
    git 
    autojump
    zsh-autosuggestions 
    zsh-syntax-highlighting
    zsh-history-substring-search
)

# after plugins and before plugin.zsh
source $ZSH/oh-my-zsh.sh

# #####################################################
# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LANG=zh_CN.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# #####################################################
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias l='exa -a'
alias ll='exa -l -U --icons --octal-permissions -b -h -i --time-style long-iso'
alias la='lsd -all'

alias c='clear'
alias gg='git clone'
alias lg="lazygit"
alias n='nvim'
alias e='emacs -nw'
alias q='exit'

alias gm="go run main.go"
alias pm="python main.py"

alias cat='bat'
alias man='tldr'
alias ping='gping'
# alias ps='procs'
alias tree='broot'

alias haorancat='cat'
alias haoranman='man'
alias haoranping='ping'
# alias haoranps='ps'
alias haorantree='tree'

alias rm=trash
alias rl='ls ~/.Trash'
alias ur=undelfile


# #####################################################
# after source $ZSH/oh-my-zsh.sh
# vi-mode
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
KEYTIMEOUT=1
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# https://gist.github.com/ssebastianj/dd4a42da5eee3304751712dc8aa1dc62
bindkey '^b' backward-char
bindkey '^f' forward-char
bindkey '^w' backward-kill-word
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward
# https://youtrack.jetbrains.com/issue/IDEA-180154/Zsh-bindkeys-forward-word-and-backward-word-do-not-work-in-Terminal

# autojump 需要下载

# git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# plugins=(git zsh-autosuggestions)
# bindkey '^p' autosuggest-accept

# 需要将源码克隆到 ~/.oh-my-zsh/custom/ 目录下配置才会生效
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# bat,  Dracula, gruvbox-dark
export BAT_THEME="OneHalfDark"


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
