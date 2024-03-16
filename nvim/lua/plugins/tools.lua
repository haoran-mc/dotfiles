return {
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
