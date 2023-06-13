# golang
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

# 安装 emacs 时，需要 pyenv 依赖
export PATH="${HOME}/.pyenv/shims:$PATH"

source ~/servicewall/secret.zsh
