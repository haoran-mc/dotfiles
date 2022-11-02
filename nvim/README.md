# nvim.lua

## 下载 neovim

- debian or ubuntu

```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```

如果提示没有发现命令 `add-apt-repository` ，需要下载软件：

```
sudo apt-get install software-properties-common
```

## 下载 lua

```
curl -R -O http://www.lua.org/ftp/lua-5.3.0.tar.gz
tar zxf lua-5.3.0.tar.gz
cd lua-5.3.0
make linux test
make install
```

## 安装插件

### 安装 Packer.nvim 插件管理器

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
