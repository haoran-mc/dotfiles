-- depend on treesitter, and it's parsers markdown, markdown_inline
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
