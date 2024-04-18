禁用跳动

```
dockdefaults write com.apple.dock no-bouncing -bool TRUE
killall Dock
```


恢复跳动

```
defaults write com.apple.dock no-bouncing -bool FALSE
killall Dock
```
