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
pacman -S i3-gaps
xmodmap -pke
xprop
xrandr
```

| software | desc                                           |
|----------|------------------------------------------------|
| picom    | 混成器，提供i3wm不支持的窗口动画及特效（透明） |
| rofi     | 程序启动器                                     |
| polybar  | Dock                                           |
| feh      | 壁纸                                           |
| maim     | 屏幕截图                                       |
| peek     | gif 录制                                       |

-    active opacity: 0.95
-  inactive opacity: 0.95
- alacritty opacity: 0.9

# 3. 快捷键

| keys        | desc           |
|-------------|----------------|
| alt-h       | 焦点左移       |
| alt-j       | 焦点下移       |
| alt-k       | 焦点上移       |
| alt-l       | 焦点右移       |
| alt-return  | 终端           |
| alt-t       | ranger         |
| alt-q       | kill           |
| alt-f       | fullscreen     |
| alt-d       | rofi 搜索工具  |
| alt-s       | 横向排列       |
| alt-v       | 纵向排列       |
| alt-w       | 窗口标签排布   |
| alt-e       | 窗口平铺排布   |
| alt-space   | float / tiling |
| alt-shift-c | reload         |
| alt-r       | resize         |
| alt-p       | screenshot     |
| alt-shift-p | peek           |

