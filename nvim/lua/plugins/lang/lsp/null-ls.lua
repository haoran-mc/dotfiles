-- null-ls 可以作为一个通用 language server 来给编辑器注入代码补全、格式化、提示、code actions
-- 等功能。也就是说，在编辑同一个 buffer 时，不只可以挂一个 language server，还可以加一个通用的
-- null-ls server 作为补充，这样，无论我们使用哪个 server 都可以共享 null-ls 提供的功能。

return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "jay-babu/mason-null-ls.nvim",
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.cmake_lint,
      },
    })
    require("null-ls.custom")
  end,
}
