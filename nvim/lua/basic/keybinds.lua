-- 设置变量，noremap表示不递归映射，silent表示不输出多余的信息
local opts = { noremap = true, silent = true }

-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t"
-- command_mode = "c",

vim.keymap.set("n", "<leader><tab>", ":e#<cr>", opts)

-- user
vim.keymap.set("n", "<leader>rc", ":e ~/.config/nvim/init.lua<cr>", opts)
-- copy current file and cursor line to clipboard
vim.keymap.set("n", "<leader>ul", ":let @+ = expand(\"%\") . \":\" . line(\".\")<CR>", opts)

-- fix :set wrap
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- insert 模式下，跳到行首行尾
vim.keymap.set("i", "<C-a>", "<home>", opts)
vim.keymap.set("i", "<C-e>", "<end>", opts)
vim.keymap.set("i", "<C-f>", "<right>", opts)
vim.keymap.set("i", "<C-b>", "<left>", opts)
vim.keymap.set("i", "<C-p>", "<up>", opts)
vim.keymap.set("i", "<C-n>", "<down>", opts)

-- c-w = ratio windows
vim.keymap.set("n", "<leader>wv", ":vsp<cr>", opts)
vim.keymap.set("n", "<leader>ws", ":sp<cr>", opts)
vim.keymap.set("n", "<leader>wc", ":q<cr>", opts)
vim.keymap.set("n", "<leader>wm", ":only<cr>", opts)
vim.keymap.set("n", "<leader>wh", "<C-w>h", opts)
vim.keymap.set("n", "<leader>wj", "<C-w>j", opts)
vim.keymap.set("n", "<leader>wk", "<C-w>k", opts)
vim.keymap.set("n", "<leader>wl", "<C-w>l", opts)
vim.keymap.set("n", "<leader>wx", "<C-w>x", opts)
vim.keymap.set("n", "<leader>w=", "<C-w>=", opts)
vim.keymap.set("n", "<C-h>", ":vertical resize -2<cr>", opts)
vim.keymap.set("n", "<C-l>", ":vertical resize +2<cr>", opts)
vim.keymap.set("n", "<C-j>", ":resize +2<cr>", opts)
vim.keymap.set("n", "<C-k>", ":resize -2<cr>", opts)

-- Editor
vim.keymap.set("n", "<leader>1", ":noh<cr>", opts)
vim.keymap.set("n", "<leader>2", ":cclose<cr>", opts)
