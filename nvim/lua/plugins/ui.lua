return {
  {
    "utilyre/sentiment.nvim", -- 高亮最近的括号
    version = "*",
    event = "VeryLazy", -- keep for lazy loading
    opts = {},
    init = function()
      -- `matchparen.vim` needs to be disabled manually in case of lazy loading
      vim.g.loaded_matchparen = 1
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "matchparen", { fg = "#FF0000" })
        end,
      })
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup()

      --[[
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = { "*.html", "*.css", "*.lua" },
        command = "ColorizerAttachToBuffer",
      })

      vim.api.nvim_create_autocmd("BufLeave", {
        pattern = { "*.html", "*.css", "*.lua" },
        command = "ColorizerDetachFromBuffer",
      })
      --]]
    end,
  },
  {
    'rainbowhxch/beacon.nvim', -- 跳转闪烁
    event = "VeryLazy",
    config = function()
      require('beacon').setup({
        enable = true,
        size = 50,
        fade = true,
        minimal_jump = 10,
        show_jumps = true,
        focus_gained = false,
        shrink = true,
        timeout = 620,
        ignore_buffers = {},
        ignore_filetypes = {},
      })
    end,
  },
}
