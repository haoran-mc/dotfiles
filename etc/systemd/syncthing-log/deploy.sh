#!/bin/bash

source $HOME/dotfiles/scripts/func-util.sh

__backup_file ~/.config/systemd/user/syncthing-log.service
__backup_file ~/.config/systemd/user/syncthing-log.timer

cp ~/dotfiles/etc/systemd/syncthing-log/syncthing-log.service ~/.config/systemd/user/syncthing-log.service
cp ~/dotfiles/etc/systemd/syncthing-log/syncthing-log.timer ~/.config/systemd/user/syncthing-log.timer


systemctl daemon-reload
systemctl --user enable syncthing-log.timer
systemctl --user start syncthing-log.timer


# systemctl --user restart syncthing-log.timer
