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
