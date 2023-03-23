# alias命令可以设置别名
# alias <new cmd>='<origin cmd>'
# 这样以后想执行<origin cmd>时就可以直接执行更短更简单的<new cmd>了

# ls加颜色，通过颜色可辨别文件类型
alias ls='ls --color=auto'
# ll为人们约定俗成的全信息列举别名
alias ll='ls -lh'
alias l='ls -all'
# 外加列出隐藏目录
alias la='ls -lAh'
# 过滤当前目录文件
alias lg='ls -A |grep -i'


# grep高亮，便于马上找到要找的字符串
alias grep='grep --color=auto' 
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# 获取自己的公网IP
alias publicip='curl ipinfo.io'

# 检查有没有网（不用可怜百度
alias netcheck='ping www.baidu.com'

# 切换到上级目录，超实用
alias ..='cd ../'
alias ...='cd ../../'

# 过滤进程
alias pg='ps aux | grep -i'

# 过滤历史
alias hg='history | grep -i'

# 查看磁盘使用情况，主要是不加-h选项的话很不舒服，所以就设了个别名
alias df='df -Th'

# 查看内存、swap使用情况，-h同上
alias free='free -h'

# 快速退出
alias q="exit"

alias c="clear"


# golang
alias gobuild='go build -o _exe -gcflags "-N -l" main.go'
alias godebug='dlv exec -r stdin:input.txt _exe'
