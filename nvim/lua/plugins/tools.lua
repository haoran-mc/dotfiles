return {
  {
    "ianva/vim-youdao-translater",
    keys = {
      { "<leader>af", "<cmd>Ydc<cr>", "n", { noremap = true, silent = true } },
    },
  },
  {
    "Mr-LLLLL/interestingwords.nvim", -- <leader>k
    config = function()
      require("interestingwords").setup {
        colors = { '#A4E57E', '#8CCBEA', '#FFDB72', '#ff0000', '#FFB3FF', '#aeee00' },
        -- colors = { '#FF7272', '#b88823', '#ffa724', '#ff2c4b' },
        search_count = true,
        navigation = true,
        scroll_center = true,
        search_key = "<leader>m",
        cancel_search_key = "<leader>M",
        color_key = "<leader>k",
        cancel_color_key = "<leader>K",
      }
    end
  }
}
