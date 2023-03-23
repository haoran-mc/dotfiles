# 添加插件

coc 本身并不提供具体语言的补全功能，只是提供了一个补全功能的平台。

所以在安装完成后，需要安装具体的语言服务以支持对应的补全功能。

想要安装子插件及相关依赖，需要先使用以下命令：

```
:CocInstall coc-json coc-tsserver
```

其中 `coc-json` `coc-tsserver` 这些是对应的支持 JSON，Typescript 的相关子插件。

要检索都有哪些子插件，可以直接在 npm 上查找 coc.nvim，亦或者使用 `coc-marketplace` 直接在 vim 里面进行管理：

```
:CocInstall coc-marketplace
```

安装完后用下面命令可以打开面板，`Tab` 可对高亮的子插件进行安装卸载等操作。

```
# 打开面板
:CocInstall marketplace

# 搜索python相关子插件
:CocList marketplace python
```

# 修改配置

在 vim 中可以对各个内置的功能或者外加的子插件进行配置。就类似 vscode 的配置系统一样。具体可以设置什么内容可以参见仓库的 [wiki](https://link.segmentfault.com/?enc=%2BEgXF%2F39QqwUNlIoJSMs8w%3D%3D.dYZsyWQd0MrmG8MdVUaVaBylrcp2GuA%2B5UzYthy5sAeLwX%2BAk8OztWpdbOBosztO)。






