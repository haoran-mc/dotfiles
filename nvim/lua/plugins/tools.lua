return {
  {
    "RRethy/vim-illuminate", -- 高亮当前的单词
    -- ft = CodeFileTypeList,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("illuminate").configure({
        -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
        filetypes_denylist = {
          "lazy",
          "neo-tree",
          "nep-tree-pop",
          "toggleterm",
          "TelescopePrompt",
          "markdown",
          "txt"
        },
        -- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
        -- Only applies to the 'regex' provider
        -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
        providers_regex_syntax_allowlist = {
          "^[_a-zA-Z][_a-zA-Z0-9]*$", -- legal variable name
        },
        -- min_count_to_highlight: minimum number of matches required to perform highlighting
        min_count_to_highlight = 2,
      })
      vim.cmd[[hi! link illuminatedWordText Visual]]
      vim.cmd[[hi! link illuminatedWordRead Visual]]
      vim.cmd[[hi! link illuminatedWordWrite Visual]]
      vim.cmd[[hi illuminatedWord cterm=underline gui=underline]]
    end
  },
  {
    "ianva/vim-youdao-translater",
    keys = {
      { "<leader>af", "<cmd>Ydc<cr>", "n", { noremap = true, silent = true } },
    },
  },
  {
    "lfv89/vim-interestingwords", -- <leader>k
    config = function ()
      vim.g['interestingWordsGUIColors'] = {
        '#A4E57E', '#8CCBEA', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF'
      }
    end
  }
}
