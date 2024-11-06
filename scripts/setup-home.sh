#!/bin/bash
set -e
source $HOME/dotfiles/scripts/func-util.sh


if [ ! -d "$HOME/haoran/disk" ]; then
    __current_status "create disk directory"
    mkdir -p "$HOME/haoran/disk/document"
    mkdir -p "$HOME/haoran/disk/music"
    mkdir -p "$HOME/haoran/disk/photo"
    mkdir -p "$HOME/haoran/disk/video"
fi

if [ ! -d "$HOME/haoran/so" ]; then
    __current_status "create software(so) directory"
    mkdir -p "$HOME/haoran/so"
fi

if [ ! -d "$HOME/haoran/gr" ]; then
    __current_status "create gr directory"
    mkdir -p "$HOME/haoran/gr"
fi

if [ ! -d "$HOME/haoran/gd" ]; then
    __current_status "create gd directory"
    mkdir -p "$HOME/haoran/gd"
fi

if [ ! -d "$HOME/haoran/tr" ]; then
    __current_status "create trash(tr) directory"
    mkdir -p "$HOME/haoran/tr"
fi

# clone from remote repository
if [ ! -d "$HOME/haoran/gr/haoran-mc.github.io" ]; then
    __current_status "git pull site(haoran-mc.github.io) directory"
    git clone git@github.com:haoran-mc/haoran-mc.github.io.git "$HOME/haoran/gr/haoran-mc.github.io"
fi

# after site, note link style files from site
if [ ! -d "$HOME/haoran/no" ]; then
    __current_status "git pull note(no) directory"
    git clone git@github.com:haoran-mc/note.git "$HOME/haoran/no"
    source "$HOME/haoran/no/setup.sh"
fi

if [ ! -d "$HOME/haoran/code" ]; then
    __current_status "git pull code directory"
    git clone git@github.com:haoran-mc/code.git "$HOME/haoran/code"
fi
