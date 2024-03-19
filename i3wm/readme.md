# 1. connect network

## nmtui

sudo pacman -S network-manager.

## nmcli

1. nmcli radio wifi :: wifi 的状态
2. nmcli radio wifi on :: 开启 Wi-Fi
3. nmcli dev wifi connect <network-ssid>
4. nmcli dev wifi connect <network-ssid> password <network-password>
5. nmcli --ask dev wifi connect <network-ssid>


1. nmcli con show
2. nmcli con down ssid/uuid
3. nmcli con up ssid/uuid


# 2. 安装软件包

1. feh：设置壁纸
2. picom：picom 提供了 i3wm 默认不支持的窗口动画及特效（透明）
3. rofi：一个程序启动器
