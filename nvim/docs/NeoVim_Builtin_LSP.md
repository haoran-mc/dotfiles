<!-- <leader>mp -->

# 认识 LSP

LSP (Language Server Protocol) 语言服务协议：

LSP 的出现将编程工具解耦成了 Language Server 与 Language Client 两部分。

- Client 代码编辑器文本界面的展示
- Server 代码语言分析（语言支持、自动补全、定义与引用解析、悬停文档提示等）

```js
// 1. 定义接口
interface User {
  name: string;
}
// 2. 实现接口的对象
const user: User = {
  name: 'hello'
}
// 3. 打印对象的age属性
console.log(user.age); // error
```

上述代码打印了 `user` 的 `age` 属性，`user` 并不具备 `age` 字段，所以按照严格的 TypeScript 语言规范来讲，代码编译会有错误：

![ts-type-error](./images/ts-type-error.png)

使用 LSP 描述这个过程：

1. 在编辑器上写入上述的 ts 代码；
2. 编辑器将上述代码通过某种协议发送给 TypeScript 语言服务器；
3. TypeScript 语言服务器读取 ts 代码，进行语法检查，得到了编译错误信息（包含行列数，基本的建议提示信息）返回给编辑器；
4. 编辑器接收到错误信息，通过自己的方式展示在编辑器 UI 上。

使用 LSP 这套体系，有两个必须步骤：

1. 获取并安装语言服务器程序；
2. 启动语言服务器，让它处于运行状态。

# nvim 中的 LSP

在 nvim 0.5+ 版本以后，已经内置了语言服务客户端的接口（[Lsp - Neovim docs](https://neovim.io/doc/user/lsp.html) 注意只是语言服务客户端部分），比较常用的 API：

- vim.lsp.buf.hover(): 代码的 tips 悬浮展示；
- vim.lsp.buf.format(): 代码格式化；
- vim.lsp.buf.references(): 当前代码符号的引用查询；
- vim.lsp.buf.implementation(): 当前代码（主要是函数方法）的实现定位；
- vim.lsp.buf.code_action(): 当前代码的一些优化操作。

但需要注意，上面都是接口方法，不具备具体的实现。具体的实现，需要为每一个编程语言单独配置。

所以，面对不同的语言，我们按照对应的语言服务的要求来配置 nvim 的内置 LSP 模块，官方的文档给出了如下的示例来启动一个 LSP：

```lua
vim.lsp.start({
  name = 'my-server-name',
  cmd = {'name-of-language-server-executable'},
  root_dir = vim.fs.dirname(vim.fs.find({'setup.py', 'pyproject.toml'}, { upward = true })[1]),
})
```

这段代码就不介绍了，因为我们将使用 lspconfig 插件，通过它更简单地配置。

# nvim-lspconfig

每当有一个编程语言需要使用 LSP 的时候，我们都需要形如上述的 nvim 原生 LSP 配置来启动对应的语言服务器，同时还需要关注很多细节，譬如，你要手动启动它等等，这一点从用户体验上是比较不友好的。

为了更加方便快速的启动语言服务，nvim 官方提供了 nvim-lspconfig 这个插件，安装了这个插件以后，我们只需要进行少量且易于理解的配置，就能通过这个插件方便快捷的启动并使用语言服务。

**到此我们就已经可以使用 nvim 的 LSP 功能了**

`:h lsp` 查看 LSP 文档的 QUICKSTART 部分：

1. 安装 nvim-lspconfig
2. 安装对应语言的 language server
3. 配置对应语言 `require('lspconfig').xx.setup{…}`
4. `:lua print(vim.inspect(vim.lsp.buf_get_clients()))` 查看 LSP 连接状态

# 以 golang 为例

1. 首先你需要安装 nvim-lspconfig，通过 Packer 安装也好，通过 Lazy 安装也好，通过别的插件管理器安装也好，手动安装也好......
2. 安装对应语言的「语言服务器」，这里安装 go 语言的语言服务器：gopls，

你可以通过 go mod 安装：

```
go get golang.org/x/tools/gopls@latest
```

3. 配置对应语言的 nvim-lspconfig

```lua
require("lspconfig").gopls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
```

现在你的 nvim 就具备了语法检查、定义与引用解析、悬停文档提示等功能。

> 注意：现在还不能代码补全，代码补全需要以 LSP 服务为基础，也就是需要上面三个步骤，然后还要安装代码补全的插件，后面会说。

# 安装 TypeScript、JavaScript、Java、Rust、C++、Python、Lua、Lisp、C#、R、Ruby、Swift、Zig、Kotlin、Haskell、Scala、Julia、Lisp、Dart、Perl、Objective-C、D、PHP、Visual Basic、Scratch

就是这么牛，我什么语言都会。

好的咱们开始配置它们的 nvim LSP 服务吧：

1. 安装 nvim-lspconfig
2. 安装对应语言的 language server
3. 配置对应语言 `require('lspconfig').xx.setup{…}`
4. `:lua print(vim.inspect(vim.lsp.buf_get_clients()))` 查看 LSP 连接状态

在上述的四个步骤中，我们必须要操作 2、3 两个步骤。

## 安装 TypeScript 的语言服务器

TypeScript 的语言服务器 typescript-language-server 是一个 npm 包，我们需要通过 `npm -g` 来全局安装它。

然后配置 nvim-lspconfig:

```lua
require("lspconfig").tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
```

## 安装 Lua 的语言服务器

Lua 的语言服务器是  lua-language-server，是一个可执行程序，我们需要从网络上下载它存放到电脑上。

我们还需要将这个可执行文件路径加入到环境变量中，以便随时在命令行中启动它们

然后配置 nvim-lspconfig:

```lua
require("lspconfig").lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
```

## 安装 Python 的语言服务器 pyright

```
npm install -g pyright
```

然后配置 nvim-lspconfig:

```lua
require("lspconfig").lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
```

## 安装 Rust 的语言服务器

```
rustup component add rls rust-analysis rust-src
```

## 安装... 够了，我受够了

能怪我吗，谁让我会那么多的语言，导致我现在需要安装那么多的语言服务器，而且安装方法还不同。

以后我要有升级 pyright、gopls、tsserver 它们的需求，岂不是要累死我。

既要关注这些语言服务器是否升级了，还要手动升级它们。

我受够了，有没有什么东西能够帮我管理它们啊！

请使用 





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
