| 命令                                                     | 解释                                           |
|----------------------------------------------------------|------------------------------------------------|
| pacman -S 软件包                                         | 下载                                           |
| pacman -R 软件包                                         | 删除一个包，并且删除它的所有依赖               |
| pacman -Rs 软件包                                        | 删除一个包，以及其不被其它包所需要的依赖项     |
| pacman -Ss 软件包                                        | 在同步越据库中查询                             |
| pacman -Qs 软件包                                        | 查找已安装的包                                 |
| pacman -F 软件包                                         | 根据文件名在远程软包中查找它所属的包           |
| pacman -Sc                                               | 删除当前未安装的所有缓存包和未使用的同步数据库 |
| pacman -Scc                                              | 从缓存中删除所有文件                           |
| pacman -U 本地软件包路径.pkg.tar.xz                      | 安装本地包                                     |
| pacman -U http://www.example.com/repo/example.pkg.tar.xz | 安装官方存储库中未包含的“远程”软件包           |


- `pacman -Syu` 升级所有已安装的软件包
  - S 代表同步
  - y 代表更新本地存储库
  - u 代表系统更新

- `pacman -Qdtq | pacman -Rs -` 如果需要这个依赖的包已经被删除了，这条命令可以删除所有不再需要的依赖项



sudo pacman -S sof-firmware alsa-firmware alsa-ucm-conf # 声音固件
sudo pacman -S ntfs-3g # 使系统可以识别 NTFS 格式的硬盘
sudo pacman -S adobe-source-han-serif-cn-fonts wqy-zenhei # 安装几个开源中文字体。
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra # 安装谷歌开源字体及表情
sudo pacman -S chromium # 安装chromium 浏览器
sudo pacman -S ark unzip # 压缩软件。在 dolphin 中可用右键解压压缩包
sudo pacman -S packagekit-qt5 packagekit appstream-qt appstream # 确保 Discover（软件中心）可用，需重启
sudo pacman -S gwenview # 图片查看器
sudo pacman -S xf86-input-libinput libinput # 触摸板驱动
sudo pacman -S archlinuxcn-keyring # cn 源中的签名（archlinuxcn-keyring 在 archlinuxcn）
sudo pacman -S yay # yay 命令可以让用户安装 AUR 中的软件（yay 在 archlinuxcn）


sudo pacman -S fcitx5-im # 输入法基础包组
sudo pacman -S fcitx5-chinese-addons # 官方中文输入引擎
sudo pacman -S fcitx5-anthy # 日文输入引擎
sudo pacman -S fcitx5-pinyin-moegirl # 萌娘百科词库。二刺猿必备（archlinuxcn）
sudo pacman -S fcitx5-material-color # 输入法主题
sudo pacman -S fcitx5-rime # Rime 输入法
