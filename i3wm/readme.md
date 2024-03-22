# 1. connect network

## nmtui

sudo pacman -S network-manager.

## nmcli

- nmcli radio wifi :: wifi 的状态
- nmcli radio wifi on :: 开启 Wi-Fi
- nmcli dev wifi connect <network-ssid>
- nmcli dev wifi connect <network-ssid> password <network-password>
- nmcli --ask dev wifi connect <network-ssid>

-----

- nmcli con show
- nmcli con down ssid/uuid
- nmcli con up ssid/uuid


# 2. 安装软件包

```
pacman -Qs i3
pacman -R i3status
```

- feh：设置壁纸
- picom：picom 提供了 i3wm 默认不支持的窗口动画及特效（透明）
- rofi：一个程序启动器
- polybar

# 3. 快捷键

- is-msg "reload"
- i3-msg "restart"

-----

- alt-h 焦点左移
- alt-j 焦点下移
- alt-k 焦点上移
- alt-l 焦点右移
- alt-ret 终端
- alt-shift-t ranger
- alt-f fullscreen
- alt-d dmenu -> rofi
- alt-s layout stacking
- alt-w layout tabbed
- alt-e layout toggle split
- alt-r resize

