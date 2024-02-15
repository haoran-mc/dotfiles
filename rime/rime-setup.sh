#!/bin/bash

# arch 下配置 fcitx5 好难啊，头都整晕了，先使用 ibus 吧。

source ../scripts/script-funcs.sh


if [[ `uname` == 'Darwin' ]]; then
    __link_file ~/dotfiles/rime/squirrel.custom.yaml ~/Library/Rime/squirrel.custom.yaml
    __link_file ~/dotfiles/rime/default.custom.yaml ~/Library/Rime/default.custom.yaml
    __link_file ~/dotfiles/rime/flypy.schema.yaml ~/Library/Rime/flypy.schema.yaml
    __link_file ~/dotfiles/rime/symbols.yaml ~/Library/Rime/symbols.yaml
    __link_file ~/dotfiles/rime/custom_phrase.txt ~/Library/Rime/custom_phrase.txt
    __link_file ~/dotfiles/rime/opencc ~/Library/Rime/opencc
    __link_file ~/dotfiles/rime/dict_ice.dict.yaml ~/Library/Rime/dict_ice.dict.yaml

    __link_file ~/dotfiles/rime/cn_dicts ~/Library/Rime/cn_dicts
    __link_file ~/dotfiles/rime/en_dicts ~/Library/Rime/en_dicts

    __link_file ~/dotfiles/rime/dict_hu.dict.yaml ~/Library/Rime/dict_hu.dict.yaml
    __link_file ~/dotfiles/rime/lua ~/Library/Rime/lua
    __link_file ~/dotfiles/rime/rime.lua ~/Library/Rime/rime.lua

    # __link_file ~/dotfiles/rime/easy_english.dict.yaml ~/Library/Rime/easy_english.dict.yaml
    # __link_file ~/dotfiles/rime/easy_english.schema.yaml ~/Library/Rime/easy_english.schema.yaml

    __link_file ~/dotfiles/rime/hupy.schema.yaml ~/Library/Rime/hupy.schema.yaml
    __link_file ~/dotfiles/rime/dict_hupy.dict.yaml ~/Library/Rime/dict_hupy.dict.yaml

    __link_file ~/dotfiles/rime/tiger.schema.yaml ~/Library/Rime/tiger.schema.yaml

    __link_file ~/dotfiles/rime/pinyin.schema.yaml ~/Library/Rime/pinyin.schema.yaml
    __link_file ~/dotfiles/rime/dict_pocket.dict.yaml ~/Library/Rime/dict_pocket.dict.yaml

elif [[ `uname` == 'Linux' ]]; then
    __link_file ~/dotfiles/rime/default.custom.yaml ~/.config/ibus/rime/default.custom.yaml
    __link_file ~/dotfiles/rime/flypy.schema.yaml ~/.config/ibus/rime/flypy.schema.yaml
    __link_file ~/dotfiles/rime/symbols.yaml ~/.config/ibus/rime/symbols.yaml
    __link_file ~/dotfiles/rime/custom_phrase.txt ~/.config/ibus/rime/custom_phrase.txt
    __link_file ~/dotfiles/rime/opencc ~/.config/ibus/rime/opencc
fi
