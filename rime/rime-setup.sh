#!/bin/bash

if [[ `uname` == 'Darwin' ]]; then
    ln -s ~/dotfiles/rime/default.custom.yaml ~/Library/Rime/default.custom.yaml
    ln -s ~/dotfiles/rime/double_pinyin_flypy.custom.yaml ~/Library/Rime/double_pinyin_flypy.custom.yaml
fi
