```
sudo pacman -S ranger
ranger --copy-config=all
```

- rc.conf 选项设置和快捷键
- commands.py 通过 `:` 执行的命令
- commands_full.py 全套的命令
- rifle.py 指定不同类型的文件默认打开程序
- scope.conf 负责各种文件预览

```
echo "export RANGER_LOAD_DEFAULT_RC=false" >> ~/.zshrc
```

图片预览：

<!-- sudo pacman -S w3m -->

```
# 安装
sudo wget -O /usr/local/bin/imgcat https://iterm2.com/utilities/imgcat

#为文件添加权限
sudo chmod 777 /usr/local/bin/imgcat
```

