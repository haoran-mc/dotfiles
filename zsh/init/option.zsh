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

# #####################################################3
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
