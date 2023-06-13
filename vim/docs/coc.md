# coc 的使用

coc.nvim 是 LSP 中的 client，LSP 的 server 是 go 官方的软件 gopls。

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
打开面板
:CocList marketplace

搜索python相关子插件
:CocList marketplace python
```

知道了 coc 的简单使用，我们开始配置 golang 的开发环境：

# golang

```
:CocInstall coc-go
```

coc.nvim 与 vim-go 的区别：

    LSP Client:
        - Autocompletion
        - Go go Definition
        - Rename
        - Diagnostics
        - precompile: errors, warning

    vim-go: （使用了coc.nvim，也可以不使用vim-go）
        - Build, Test, Run
        - Go Docs
        - Debug
        - Format(go fmt)

coc 的功能非常齐全，coc 各种复杂的属性、配置、插件，让人没有研究下去的欲望。因此，我们只专注与 coc 核心的功能。

从简单角度出发，仅使用 coc 的以下功能：

- 自动补全；
- 定义跳转；
- 诊断；

通过配置 coc 相关的参数，就可以支持以上功能。

另外，还要开启 language server 支持 golang，输入 `:CocConfig`，会进入 coc 的配置文件，在其输入：

```
{
  "languageserver": {
    "golang": {
      "command": "gopls",
      "rootPatterns": ["go.mod", ".git/"],
      "filetypes": ["go"]
    }
  }
}
```

现在 coc 能够支持 golang 了，可以开始补全，跳转，语法检查等工作，就这么简单，你已经拥有了一个强大的 golang 编辑器

# snippet

下载 snippet 引擎

```
:CocInstall coc-snippet
```

下载 [vim-snippet](https://github.com/honza/vim-snippets) 插件，然后在 coc-snippet 配置自己的 snippets 文件夹

```
"snippets.ultisnips.directories": [
	"~/dotifles/vim/snippets/"
]
```

在此文件夹下创建 go.snippets 文件。

# 更多的配置在 github 上查看

[coc](https://github.com/neoclide/coc.nvim)

在 vim 中可以对各个内置的功能或者外加的子插件进行配置。就类似 vscode 的配置系统一样。具体可以设置什么内容可以参见仓库的 [wiki](https://github.com/neoclide/coc.nvim/wiki)。

# c++/c

```
命令行中
brew install clang-format

vim命令行
CocInstall coc-clangd
```



