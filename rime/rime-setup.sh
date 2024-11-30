#!/bin/bash

source ../scripts/func-util.sh

# sudo pacman -S fcitx5 fcitx5-qt fcitx5-gtk fcitx5-configtool fcitx5-rime


if [[ `uname` == 'Darwin' ]]; then
    __link_file ~/dotfiles/rime/squirrel.custom.yaml ~/Library/Rime/squirrel.custom.yaml

    __link_file ~/dotfiles/rime/default.custom.yaml ~/Library/Rime/default.custom.yaml
    __link_file ~/dotfiles/rime/symbols.yaml ~/Library/Rime/symbols.yaml
    __link_file ~/dotfiles/rime/custom_phrase.txt ~/Library/Rime/custom_phrase.txt
    __link_file ~/dotfiles/rime/opencc ~/Library/Rime/opencc

    __link_file ~/dotfiles/rime/lua ~/Library/Rime/lua
    __link_file ~/dotfiles/rime/rime.lua ~/Library/Rime/rime.lua

    __link_file ~/dotfiles/rime/cn_dicts ~/Library/Rime/cn_dicts
    __link_file ~/dotfiles/rime/en_dicts ~/Library/Rime/en_dicts
    __link_file ~/dotfiles/rime/dict_ice.dict.yaml ~/Library/Rime/dict_ice.dict.yaml
    __link_file ~/dotfiles/rime/flypy.schema.yaml ~/Library/Rime/flypy.schema.yaml

    # __link_file ~/dotfiles/rime/easy_english.dict.yaml ~/Library/Rime/easy_english.dict.yaml
    # __link_file ~/dotfiles/rime/easy_english.schema.yaml ~/Library/Rime/easy_english.schema.yaml

    __link_file ~/dotfiles/rime/hu.schema.yaml ~/Library/Rime/hu.schema.yaml
    __link_file ~/dotfiles/rime/dict_hu.dict.yaml ~/Library/Rime/dict_hu.dict.yaml
    __link_file ~/dotfiles/rime/hupy.schema.yaml ~/Library/Rime/hupy.schema.yaml
    __link_file ~/dotfiles/rime/dict_hupy.dict.yaml ~/Library/Rime/dict_hupy.dict.yaml

    __link_file ~/dotfiles/rime/pinyin.schema.yaml ~/Library/Rime/pinyin.schema.yaml
    __link_file ~/dotfiles/rime/dict_pocket.dict.yaml ~/Library/Rime/dict_pocket.dict.yaml

    # __link_file ~/dotfiles/rime/yi.schema.yaml ~/Library/Rime/yi.schema.yaml
    # __link_file ~/dotfiles/rime/yi.dict.yaml ~/Library/Rime/yi.dict.yaml

elif [[ `uname` == 'Linux' ]]; then
    # ibus ##################
    # __link_file ~/dotfiles/rime/default.custom.yaml ~/.config/ibus/rime/default.custom.yaml
    # __link_file ~/dotfiles/rime/symbols.yaml ~/.config/ibus/rime/symbols.yaml
    # __link_file ~/dotfiles/rime/custom_phrase.txt ~/.config/ibus/rime/custom_phrase.txt
    # __link_file ~/dotfiles/rime/opencc ~/.config/ibus/rime/opencc

    # __link_file ~/dotfiles/rime/lua ~/.config/ibus/rime/lua
    # __link_file ~/dotfiles/rime/rime.lua ~/.config/ibus/rime/rime.lua

    # # __link_file ~/dotfiles/rime/flypy.schema.yaml ~/.config/ibus/rime/flypy.schema.yaml

    # __link_file ~/dotfiles/rime/cn_dicts ~/.config/ibus/rime/cn_dicts

    # __link_file ~/dotfiles/rime/hu.schema.yaml ~/.config/ibus/rime/hu.schema.yaml
    # __link_file ~/dotfiles/rime/dict_hu.dict.yaml ~/.config/ibus/rime/dict_hu.dict.yaml
    # __link_file ~/dotfiles/rime/hupy.schema.yaml ~/.config/ibus/rime/hupy.schema.yaml
    # __link_file ~/dotfiles/rime/dict_hupy.dict.yaml ~/.config/ibus/rime/dict_hupy.dict.yaml

    # fcitx5 ##################
    __link_file /home/haoran/dotfiles/rime/default.custom.yaml /usr/share/rime-data/default.custom.yaml
    # ↑ ~/.local/share/rime/.

    __link_file /home/haoran/dotfiles/rime/symbols.yaml /usr/share/rime-data/symbols.yaml
    __link_file /home/haoran/dotfiles/rime/custom_phrase.txt /usr/share/rime-data/custom_phrase.txt
    __link_file /home/haoran/dotfiles/rime/opencc /usr/share/rime-data/opencc

    __link_file /home/haoran/dotfiles/rime/lua /usr/share/rime-data/lua
    __link_file /home/haoran/dotfiles/rime/rime.lua /usr/share/rime-data/rime.lua

    __link_file /home/haoran/dotfiles/rime/cn_dicts /usr/share/rime-data/cn_dicts

    __link_file /home/haoran/dotfiles/rime/hu.schema.yaml /usr/share/rime-data/hu.schema.yaml
    __link_file /home/haoran/dotfiles/rime/dict_hu.dict.yaml /usr/share/rime-data/dict_hu.dict.yaml
    __link_file /home/haoran/dotfiles/rime/hupy.schema.yaml /usr/share/rime-data/hupy.schema.yaml
    __link_file /home/haoran/dotfiles/rime/dict_hupy.dict.yaml /usr/share/rime-data/dict_hupy.dict.yaml

    # just for the first testing
    # __link_file ~/dotfiles/rime/pinyin.schema.yaml ~/.local/share/fcitx5/rime/pinyin.schema.yaml
    # __link_file ~/dotfiles/rime/dict_pocket.dict.yaml ~/.local/share/fcitx5/rime/dict_pocket.dict.yaml
fi
