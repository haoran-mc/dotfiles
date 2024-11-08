#!/bin/bash

ln -sf /Users/haoran/dotfiles/etc/launchd/syncthing-log/syncthing-log.plist /Users/haoran/Library/LaunchAgents/syncthing-log.plist

launchctl load ~/Library/LaunchAgents/syncthing-log.plist

launchctl start ran.job.syncthing-log

