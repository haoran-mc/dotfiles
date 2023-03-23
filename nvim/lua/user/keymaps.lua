-- 设置变量，noremap表示不递归映射，silent表示不输出多余的信息
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t", command_mode = "c",

keymap("n", "<leader><tab>", ":e#<cr>", opts)

-- user
keymap("n", "<leader>rc", ":e ~/.config/nvim/init.lua<cr>", opts)
keymap("n", "<leader>ut", ":Template algorithm<cr>", opts)
keymap("n", "<leader>uf", ":Ydc<cr>", opts)
-- copy current file and cursor line to clipboard
keymap("n", "<leader>ul", ":let @+ = expand(\"%\") . \":\" . line(\".\")<CR>", opts)
keymap("n", "<leader>odr", ":NvimTreeOpen ~/dotfiles<cr>", opts) -- open
keymap("n", "<leader>odd", ":NvimTreeOpen ~/<cr>", opts)
keymap("n", "<leader>odh", ":NvimTreeOpen ~/haoran<cr>", opts)
keymap("n", "<leader>odtr", ":NvimTreeOpen ~/haoran/tr<cr>", opts)
keymap("n", "<leader>odsw", ":NvimTreeOpen ~/haoran/gr/servicewall<cr>", opts)

-- fix :set wrap
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- insert 模式下，跳到行首行尾
keymap("i", "<C-a>", "<home>", opts)
keymap("i", "<C-e>", "<end>", opts)
keymap("i", "<C-f>", "<right>", opts)
keymap("i", "<C-b>", "<left>", opts)
keymap("i", "<C-p>", "<up>", opts)
keymap("i", "<C-n>", "<down>", opts)

-- c-w = ratio windows
keymap("n", "<leader>wv", ":vsp<cr>", opts)
keymap("n", "<leader>ws", ":sp<cr>", opts)
keymap("n", "<leader>wc", ":q<cr>", opts)
keymap("n", "<leader>wo", ":only<cr>", opts)
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)
keymap("n", "<leader>wx", "<C-w>x", opts)
keymap("n", "<leader>w=", "<C-w>=", opts)
keymap("n", "<C-h>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-l>", ":vertical resize +2<cr>", opts)
keymap("n", "<C-j>", ":resize +2<cr>", opts)
keymap("n", "<C-k>", ":resize -2<cr>", opts)

-- Find, File
keymap("n", "<leader>ft", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>fO", ":NvimTreeOpen .<cr>", opts)
keymap("n", "<leader>fo", ":NvimTreeFindFile<cr>", opts)
keymap("n", "<leader>fj", ":HopLine<cr>", opts)
keymap("n", "<leader>fk", ":HopLine<cr>", opts)
keymap("n", "<leader>fw", ":HopWord<cr>", opts)    -- all word
keymap("n", "<leader>fa", ":HopWordMW<cr>", opts)  -- all windows
keymap("n", "<leader>fh", ":HopWordCurrentLineBC<cr>", opts)
keymap("n", "<leader>fl", ":HopWordCurrentLineAC<cr>", opts)

-- ranger, dired
keymap("n", "<leader>dj", ":Ranger<cr>", opts)

-- tab
keymap("n", "<leader>tn", ":tabnew<cr>",opts)

-- Telescope
keymap("n", "<leader>pf", "<cmd>Telescope fd<cr>", opts)
keymap("n", "<leader>psr", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>bb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>tj", "<cmd>Telescope jumplist<cr>", opts)

-- Toggleterm
keymap("n", "<leader>ot", "<cmd>ToggleTerm<cr>", opts)

-- Editor
keymap("n", "<leader>1", ":noh<cr>", opts)
keymap("n", "<leader>2", ":cclose<cr>", opts)

-- vim-go plugin settings
vim.g['go_def_mapping_enabled'] = 0
vim.g['go_fmt_command'] = 'goimports'

-- Debug
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>df", "<cmd>lua require'dapui'.float_element()<cr>", opts)
keymap('n', '<F10>', '<cmd>lua require"user.dap.dap-util".reload_continue()<CR>', opts)
keymap("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opts)
keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opts)

