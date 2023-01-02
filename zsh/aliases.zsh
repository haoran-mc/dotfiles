alias c='clear'
alias gg='git clone'
alias ra='ranger'
alias vsc='code'
alias n='nvim'
alias e='emacs -nw'
alias v='vim -u ~/dotfiles/vim/tiny.vim'
alias vi='vim'
alias vim='vim'
alias V='vim -u NONE -N'
alias f='figlet'
alias q='exit'
alias t='tree'
alias nnn='source ~/haoran/Code/Editor/Git/push.sh'
alias NEXTLINE='echo ""'
alias gm="go run main.go"

alias hard_pull="git fetch --all && git reset --hard origin/main && git pull"
alias hard_push="git commit --amend && git push -f"

alias win="cd /mnt/c/Users/haora"
# alias upv="cp ~/dotfiles/vim/windows-gui-for-algorithm.vim /mnt/c/Users/haora/.vimrc"
alias upv="rm -rf /mnt/c/Users/haora/dotfiles && cp -r ~/dotfiles /mnt/c/Users/haora/dotfiles"
