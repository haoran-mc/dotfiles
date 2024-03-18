# connect network

## nmtui

sudo pacman -S network-manager.

## nmcli

1. nmcli radio wifi :: display wifi's status
2. nmcli radio wifi on :: start Wi-Fi
3. nmcli dev wifi connect <network-ssid>
4. nmcli dev wifi connect <network-ssid> password <network-password>
5. nmcli --ask dev wifi connect <network-ssid>


1. nmcli con show
2. nmcli con down ssid/uuid
3. nmcli con up ssid/uuid
