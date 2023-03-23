local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  vim.notify("gitsigns not found!")
  return
end

gitsigns.setup {
  signs = {
    add          = { text = '█' },
    change       = { text = '█' },
    delete       = { text = '█' },
    topdelete    = { text = '█' },
    changedelete = { text = '█' },
    untracked    = { text = '█' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  max_file_length = 3000, -- Disable if file is longer than this (in lines)
}
