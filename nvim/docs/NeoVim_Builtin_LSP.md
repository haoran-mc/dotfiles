LSP (Language Server Protocol) 语言服务协议：
LSP 的出现将编程工具解耦成了 Language Server 与 Language Client 两部分。
Client 专注于显示样式实现
Server 负责提供语言支持，包括常见的自动补全、跳转到定义、查找引用、悬停文档提示等

`:h lsp` 查看 LSP 文档的 QUICKSTART 部分：

1. 安装 nvim-lspconfig
2. 安装对应语言的 language server
3. 配置对应语言 `require('lspconfig').xx.setup{…}`
4. `:lua print(vim.inspect(vim.lsp.buf_get_clients()))` 查看 LSP 连接状态


安装 nvim-lspconfig 是为了简化 LSP 的安装和配置。

> nvim-lspconfig is a collection of community-contributed configurations for the
> built-in language server client in Nvim core. This plugin provides four
> primary functionalities:
> 
>  - default launch commands, initialization options, and settings for each
>    server
>  - a root directory resolver which attempts to detect the root of your project
>  - an autocommand mapping that either launches a new language server or
>    attempts to attach a language server to each opened buffer if it falls
>    under a tracked project
>  - utility commands such as LspInfo, LspStart, LspStop, and LspRestart for
>    managing language server instances
> 
> nvim-lspconfig is not required to use the builtin Nvim |lsp| client, it is
> just a convenience layer.
> 
> See |lspconfig-all| for the complete list of language server configurations.


以 golang 为例，你需要安装 language server: gopls。

你可以通过 go mod 安装： 

```
go get golang.org/x/tools/gopls@latest
```

如果你还要安装 TypeScript Language Server，就可以到其主页 [typescript-language-server](https://github.com/typescript-language-server/typescript-language-server) 寻找安装方法。

如果你需要的语言服务器非常多，且经常需要卸载、更新等操作，「安装对应语言的 language server」这步看似简单，实则麻烦。

有什么办法帮助我们简化呢？

> [neovim/nvim-lspconfig VS mason.nvim (nvim-lsp-installer)](https://www.reddit.com/r/neovim/comments/w7s1dr/comment/ihlciq4/?utm_source=share&utm_medium=web2x&context=3)
>
> [mason](https://github.com/williamboman/mason.nvim) provides a repository and frontend that helps a user manage the installation of various third-party tools (LSP servers, formatters, linters, etc...) that can be useful when running neovim. It also provides an API for plugin developers. (the 'repository' mentioned earlier is not of the tools themselves, but of configuration that details how to install each tool.)
> 
> [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) provides (very) basic configurations for LSP servers, and a simpler configuration to interact with neovim. One thing it does not, and cannot easily, provide is the path to the command to use when launching the server. This brings me to...
>
> [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) uses Mason to ensure installation of user specified LSP servers and will tell nvim-lspconfig what command to use to launch those servers.
>
> nvim-lsp-installer has been superseded by mason + mason-lspconfig.
>
> I would recommend all of mason, mason-lspconfig, nvim-lspconfig. They do not conflict, they work together.
