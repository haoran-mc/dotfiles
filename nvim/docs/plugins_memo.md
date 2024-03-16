| plugin                | desc                                        |
|-----------------------+---------------------------------------------|
| indent-blankline      | 缩进基准线                                  |
| lualine               | 状态栏插件                                  |
| navic                 | winbar 更推荐官方的 nvim-treesitter-context |
| neo-tree              | 侧边栏插件                                  |
| nvim-colorizer        | 高亮颜色                                    |
| onedark               | 主题                                        |
| tabby                 | tab栏                                       |
| SmoothCursor.nvim     | 光标前缀                                    |
| rayso.nvim            | 代码图片                                    |
|                       |                                             |
| calendar              | 日历插件                                    |
| comment               | 注释插件                                    |
| copilot-cmp           |                                             |
| copilot               |                                             |
| dressing              | UI增强                                      |
| gitsigns,vgit         | git                                         |
| hop.nvim,leap.nvim    | 快速移动                                    |
| nvim-autopairs        | 自动补全括号                                |
| nvim-surround         | 括号配对                                    |
| telescope             | 模糊查找                                    |
| todo-comments         | TODO注释                                    |
| toggleterm            | 终端                                        |
| vim-illuminate        | 高亮当前变量                                |
| vim-interestingwords  | 单词高亮                                    |
| vim-youdao-translater | 翻译                                        |
| symbols-outline       | 显示大纲                                    |
|                       |                                             |
| markdown-preview      | markdown 预览                               |
| vim-table-mode        | markdown 表格对齐                           |
|                       |                                             |
| fidget.nvim           | nvim-lsp progress                           |
| lsp_signature         | 函数签名                                    |
| mason                 | formatter, linter, lsp, dap 管理器          |
| null-ls               | 通用的 language server                      |
| nvim-cmp              | 代码补全                                    |
| nvim-lightbulb        | code action                                 |
| nvim-lspconfig        | language client                             |
| nvim-treesitter       | 语法分析                                    |
|                       |                                             |
| web-tools             | 前端？                                      |
| vim-go                | golang                                      |


- nvim-treesitter
    - nvim-yati: should be no longer needed


```lua
return {
  {
    "jghauser/follow-md-links.nvim",
    ft = "markdown",
  },
  {

    "dhruvasagar/vim-table-mode",
    keys = {
      { "<leader>mt", "<cmd>TableModeEnable<cr>", "n", { silent = true } },
    },
    init = function()
    end,
  }
}
```
