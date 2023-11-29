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
      require("colorizer").setup({
        "css",
        "javascript",
        "html",
        "lua",
      }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        mode = "background", -- Set the display mode.
      })

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = { "*.html", "*.css", "*.lua" },
        command = "ColorizerAttachToBuffer",
      })

      vim.api.nvim_create_autocmd("BufLeave", {
        pattern = { "*.html", "*.css", "*.lua" },
        command = "ColorizerDetachFromBuffer",
      })
    end,
  },
}
