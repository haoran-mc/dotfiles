#!/bin/bash

# arch 下配置 fcitx5 好难啊，头都整晕了，先使用 ibus 吧。

source ../scripts/script-funcs.sh


if [[ `uname` == 'Darwin' ]]; then
    __link_file ~/dotfiles/rime/squirrel.custom.yaml ~/Library/Rime/squirrel.custom.yaml
    __link_file ~/dotfiles/rime/default.custom.yaml ~/Library/Rime/default.custom.yaml
    __link_file ~/dotfiles/rime/double_pinyin_flypy.custom.yaml ~/Library/Rime/double_pinyin_flypy.custom.yaml
    __link_file ~/dotfiles/rime/symbols.yaml ~/Library/Rime/symbols.yaml
    __link_file ~/dotfiles/rime/custom_phrase.txt ~/Library/Rime/custom_phrase.txt
    __link_file ~/dotfiles/rime/opencc ~/Library/Rime/opencc
    __link_file ~/dotfiles/rime/rime_ice.dict.yaml ~/Library/Rime/rime_ice.dict.yaml

    __link_file ~/dotfiles/rime/cn_dicts ~/Library/Rime/cn_dicts
    __link_file ~/dotfiles/rime/en_dicts ~/Library/Rime/en_dicts

    __link_file ~/dotfiles/rime/rime_hu.dict.yaml ~/Library/Rime/rime_hu.dict.yaml
    __link_file ~/dotfiles/rime/lua ~/Library/Rime/lua
    __link_file ~/dotfiles/rime/rime.lua ~/Library/Rime/rime.lua

    # __link_file ~/dotfiles/rime/easy_english.dict.yaml ~/Library/Rime/easy_english.dict.yaml
    __link_file ~/dotfiles/rime/easy_english.schema.yaml ~/Library/Rime/easy_english.schema.yaml

    __link_file ~/dotfiles/rime/PY_c.schema.yaml ~/Library/Rime/PY_c.schema.yaml
    # __link_file ~/dotfiles/rime/PY_c.dict.yaml ~/Library/Rime/PY_c.dict.yaml
    __link_file ~/dotfiles/rime/PY_c.txt ~/Library/Rime/PY_c.txt

    # __link_file ~/dotfiles/rime/tiger.custom.yaml ~/Library/Rime/tiger.custom.yaml
    __link_file ~/dotfiles/rime/tiger.schema.yaml ~/Library/Rime/tiger.schema.yaml

    # __link_file ~/dotfiles/rime/tigress.custom.yaml ~/Library/Rime/tigress.custom.yaml
    # __link_file ~/dotfiles/rime/tigress.dict.yaml ~/Library/Rime/tigress.dict.yaml
    # __link_file ~/dotfiles/rime/tigress.extended.dict.yaml ~/Library/Rime/tigress.extended.dict.yaml
    # __link_file ~/dotfiles/rime/tigress.schema.yaml ~/Library/Rime/tigress.schema.yaml
    # __link_file ~/dotfiles/rime/tigress_ci.dict.yaml ~/Library/Rime/tigress_ci.dict.yaml
    # __link_file ~/dotfiles/rime/tigress_simp_ci.dict.yaml ~/Library/Rime/tigress_simp_ci.dict.yaml

elif [[ `uname` == 'Linux' ]]; then
    __link_file ~/dotfiles/rime/default.custom.yaml ~/.config/ibus/rime/default.custom.yaml
    __link_file ~/dotfiles/rime/double_pinyin_flypy.custom.yaml ~/.config/ibus/rime/double_pinyin_flypy.custom.yaml
    __link_file ~/dotfiles/rime/symbols.yaml ~/.config/ibus/rime/symbols.yaml
    __link_file ~/dotfiles/rime/custom_phrase.txt ~/.config/ibus/rime/custom_phrase.txt
    __link_file ~/dotfiles/rime/opencc ~/.config/ibus/rime/opencc
fi
