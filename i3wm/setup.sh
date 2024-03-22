#!/bin/sh

set -e

source ../scripts/script-funcs.sh


if [ ! -d ~/.config/i3 ]; then
    mkdir ~/.config/i3
fi
__link_file ~/dotfiles/i3wm/config ~/.config/i3/config


if [ ! -d ~/.config/picom ]; then
    mkdir ~/.config/picom
fi
__link_file ~/dotfiles/i3wm/picom.conf ~/.config/picom/picom.conf


if [ ! -d ~/.config/polybar ]; then
    mkdir ~/.config/polybar
fi
__link_file ~/dotfiles/i3wm/polybar.ini ~/.config/polybar/config.ini
