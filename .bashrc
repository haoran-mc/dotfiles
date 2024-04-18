###################################################################
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN:$GOROOT/bin
export GO111MODULE=on
export GOPROXY=https://goproxy.io,direct

export EDITOR="vim"
export TERM="screen-256color"
export LC_ALL=C
export LANG=en_US.UTF-8

# History control
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=100000
HISTFILESIZE=2000000
shopt -s histappend

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

###################################################################
# alias命令可以设置别名
# alias <new cmd>='<origin cmd>'
# 这样以后想执行<origin cmd>时就可以直接执行更短更简单的<new cmd>了

alias ls='ls --color=auto'
alias ll='ls -lh'
alias l='ls -a'
alias la='ls -lAh'
alias lg='ls -A |grep -i'
alias grep='grep --color=auto' 
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ..='cd ../'
alias ...='cd ../../'
alias df='df -Th'
alias free='free -h'
alias q="exit"
alias c="clear"
alias docker-format='docker ps -a --format "table {{.Names}}"'

# 获取自己的公网IP
alias publicip='curl ipinfo.io'
alias biggest="du -h --max-depth=1 | sort -h"

alias gobuild='go build -o _exe -gcflags "-N -l" main.go'
alias godebug='dlv exec -r stdin:input.txt _exe'

###################################################################
#                             \u haoran     @            \h 主机        \W 最后一个目录            \$ 提示字符
PS1="\[\e[32;1m\][\[\e[33;1m\]\u\[\e[31;1m\]@\[\e[33;1m\]\h \[\e[36;1m\]\W\[\e[32;1m\]]\[\e[35;1m\]\$ \[\e[0m\]"

# \d ：代表日期，格式为weekday month date，例如："Mon Aug 1"
# \H ：完整的主机名称
# \h ：仅取主机的第一个名字
# \t ：显示时间为24小时格式，如：HH:MM:SS
# \T ：显示时间为12小时格式
# \A ：显示时间为24小时格式：HH:MM
# \u ：当前用户的账号名称
# \v ：BASH的版本信息
# \w ：完整的工作目录名称。家目录会以 ~代替
# \W ：利用basename取得工作目录名称，所以只会列出最后一个目录
# \# ：下达的第几个命令
# \$ ：提示字符，如果是root时，提示符为：# ，普通用户则为：$

###################################################################
# useful unarchiver!
function extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)    tar xjf $1          ;;
			*.tar.gz)     tar xzf $1          ;;
			*.bz2)        bunzip2 $1          ;;
			*.rar)        rar x $1            ;;
			*.gz)         gunzip $1           ;;
			*.tar)        tar xf $1           ;;
			*.tbz2)       tar xjf $1          ;;
			*.tgz)        tar xzf $1          ;;
			*.zip)        unzip $1            ;;
			*.Z)          uncompress $1       ;;
			*)            echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}
