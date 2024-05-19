# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# env prompt plugins user-configuration alias
# zsh 文件加载顺序：.zshenv → .zprofile → .zshrc → .zlogin → .zlogout
# 为了环境变量不被 .zprofile 覆盖，使用 .zshrc 存放环境变量

# env ##############################################
# nvim
export NVIM_PATH=/usr/local/nvim-macos
export PATH=$PATH:$NVIM_PATH/bin

# golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$GOROOT/bin:$PATH
export GO111MODULE=on
export GOPROXY=https://goproxy.io,direct
# export GOPROXY=https://goproxy.cn

# python
export PYTHONPATH=/usr/bin/python3
export PYENV_ROOT=/Users/haoran/.pyenv

# java
# export JAVA_HOME=/usr/local/java/jdk1.8.0_201
export JAVA_HOME=/opt/homebrew/Cellar/openjdk/21.0.2/bin
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$JAVA_HOME/bin:$PATH

# lua
export LUA_PATH="./?.lua;;"

export PATH=$PATH:/Users/haoran/.local/bin

# 安装 emacs 时，需要 pyenv 依赖
export PATH=$HOME/.pyenv/shims:$PATH

# 取消 tldr 自动更新
export TLDR_AUTO_UPDATE_DISABLED=true

# 使用自己的 ranger 配置
export RANGER_LOAD_DEFAULT_RC=false

# ripgrep configuration file
export RIPGREP_CONFIG_PATH=/Users/haoran/dotfiles/.ripgreprc

# nvm: curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # T

if [ -f ~/servicewall/secret.zsh ]; then
	source ~/servicewall/secret.zsh
fi

# prompt ##############################################
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

# plugins #############################################
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

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    vi-mode
    zsh-autosuggestions
    zsh-syntax-highlighting
	copypath
	you-should-use
)
# git support git aliases
# autojump quick jump with j
# zsh-history-substring-search
# copyfile

# after plugins and before plugin.zsh
source $ZSH/oh-my-zsh.sh

# after source $ZSH/oh-my-zsh.sh
# vi-mode
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
KEYTIMEOUT=1
# https://gist.github.com/ssebastianj/dd4a42da5eee3304751712dc8aa1dc62
bindkey '^b' backward-char
bindkey '^f' forward-char
bindkey '^w' backward-kill-word
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^p' up-line-or-beginning-search
bindkey '^n' down-line-or-beginning-search
# you should use
export YSU_MESSAGE_POSITION="after"

# user configuration ##################################
# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# export LANG=zh_CN.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# export BAT_CONFIG_PATH="${HOME}/dotfiles/bat.conf"
# --list-theme
export BAT_THEME="OneHalfDark"

# add less' arg -X for delta pager
export DELTA_PAGER="less -X $LESS"

# ostype ##############################################
if [[ "$OSTYPE" = darwin* ]]; then
    undelfile()
    {
        mv -i ~/.Trash/$@ ./
    }

    alias rm=trash
    alias rl='ls ~/.Trash'
    alias ur=undelfile
	alias vim='nvim'

	vimedit()
	{
		touch $1
		open -a MacVim $1
	}

    alias v=vimedit
elif [[ "$OSTYPE" = linux-gnu* ]]; then
    # echo "I'm Linux"
    export GTK_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus
    export QT_IM_MODULE=ibus

	alias v=vim
else
    echo "unknow os"
fi

# highlight man page ##################################
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1

# alias ###############################################
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias l='eza -a'
alias ll='eza -l -U --icons --octal-permissions -b -h -i --time-style long-iso --git'
alias lt='eza -l -U --icons --octal-permissions -b -h -i --time-style long-iso --git --sort=created --reverse'
alias la='eza -l -U --icons --octal-permissions -b -h -i --time-style long-iso --git -a'

alias c='clear'
alias gg='git clone'
alias lg='lazygit'
alias n='nvim'
alias e='emacsclient -n'
alias q='exit'
alias so='source ~/.zshrc'
alias capacity='find /sys/ -name capacity -exec cat {} \;'

alias sudo='sudo '

alias gm='go run main.go'
alias pm='python main.py'
alias lm='lua main.lua'
gobuild()
{
	go build -o _exe -gcflags "-N -l" $1
}
alias godebug='dlv exec _exe'

source ~/dotfiles/scripts/help-funcs.sh
alias ran=__help_tldr

alias cat='bat'
# alias man='tldr'
alias ping='gping'
# alias ps='procs'
# alias tree='broot'


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
# ^r fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
