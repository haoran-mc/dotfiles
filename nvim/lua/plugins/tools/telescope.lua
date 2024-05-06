-- NOTE: install ripgrep for live_grep picker

-- ====for live_grep raw====:
-- for rp usage: reference: https://segmentfault.com/a/1190000016170184
-- -i ignore case
-- -s 大小写敏感
-- -w match word
-- -e 正则表达式匹配
-- -v 反转匹配
-- -g 通配符文件或文件夹，可以用!来取反
-- -F fixed-string 原意字符串，类似python的 r'xxx'

-- examples:
-- command	Description
-- rg image utils.py	Search in a single file utils.py
-- rg image src/	Search in dir src/ recursively
-- rg image	Search image in current dir recursively
-- rg '^We' test.txt	Regex searching support (lines starting with We)
-- rg -i image	Search image and ignore case (case-insensitive search)
-- rg -s image	Smart case search
-- rg -F '(test)'	Search literally, i.e., without using regular expression
-- rg image -g '*.py'	File globing (search in certain files), can be used multiple times
-- rg image -g '!*.py'	Negative file globing (do not search in certain files)
-- rg image --type py or rg image -tpy1	Search image in Python file
-- rg image -Tpy	Do not search image in Python file type
-- rg -l image	Only show files containing image (Do not show the lines)
-- rg --files-without-match image	Show files not containing image
-- rg -v image	Inverse search (search files not containing image)
-- rg -w image	Search complete word
-- rg --count	Show the number of matching lines in a file
-- rg --count-matches	Show the number of matchings in a file
-- rg neovim --stats	Show the searching stat (how many matches, how many files searched etc.)

-- ====for fzf search=====
-- Token	Match type	Description
-- sbtrkt	fuzzy-match	Items that match sbtrkt
-- 'wild	exact-match (quoted)	Items that include wild
-- ^music	prefix-exact-match	Items that start with music
-- .mp3$	suffix-exact-match	Items that end with .mp3
-- !fire	inverse-exact-match	Items that do not include fire
-- !^music	inverse-prefix-exact-match	Items that do not start with music
-- !.mp3$	inverse-suffix-exact-match	Items that do not end with .mp3

-- A single bar character term acts as an OR operator.
-- For example, the following query matches entries that start with core and end with either go, rb, or py.
-- ^core go$ | rb$ | py$

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-smart-history.nvim", dependencies = "kkharji/sqlite.lua" },
		{ "nvim-telescope/telescope-project.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-symbols.nvim" },
	},
	keys = {
		-- keymaps, help_tags, marks
		{ "<leader>f<leader>", "<cmd>Telescope <CR>", "n", { noremap = true, silent = true } },
		{ "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<CR>", "n", { noremap = true, silent = true } },
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", "n", { noremap = true, silent = true } },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", "n", { noremap = true, silent = true } },
		{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", "n", { noremap = true, silent = true } },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", "n", { noremap = true, silent = true } },
		{
			"<leader>fp",
			"<cmd>lua require'telescope'.extensions.project.project{display_type = 'full'}<CR>",
			"n",
			{ noremap = true, silent = true, desc = "Telescope project" },
		},
		{
			"<leader>fe",
			"<cmd>lua require'telescope.builtin'.symbols{'nerd','emoji','gitemoji','julia'} <CR>",
			"n",
			{ noremap = true, silent = true, desc = "Telescope symbols" },
		},
	},
	config = function()
		if vim.fn.has("wsl") == 0 and vim.fn.has("win32") == 1 then
			vim.g.sqlite_clib_path = "C:/Windows/System32/sqlite3.dll"
		end
		require("telescope").setup({
			defaults = {
				border = true,
				winblend = 0,
				dynamic_preview_title = true,
				path_display = { "truncate" },
				layout_strategy = "cursor", -- horizontal center cursor vertical flex bottom_pane
				layout_config = {
					preview_cutoff = 1,
					bottom_pane = {
						height = 0.5,
						prompt_position = "bottom",
					},
					center = {
						width = 0.9,
						height = 0.4,
					},
					cursor = {
						width = 0.7,
						height = 0.5,
					},
					vertical = {
						width = 0.9,
						height = 0.5,
					},
					horizontal = {
						width = 0.9,
						height = 0.5,
					},
				},
				history = {
					path = vim.fn.stdpath("data") .. "/telescope_history.sqlite3",
					limit = 100,
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--trim",
					"--no-ignore",
					"--hidden",
				},
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				sorting_strategy = "descending",
				file_ignore_patterns = {
					"^node_modules",
					"^.git",
					".cache",
					"%.class",
					"^build",
					"^docs$",
				},
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				mappings = {
					i = {
						["<C-p>"] = require("telescope.actions").move_selection_previous,
						["<C-n>"] = require("telescope.actions").move_selection_next,
						["<C-c>"] = require("telescope.actions").close,
						["<C-[>"] = require("telescope.actions").close,
						["<Esc>"] = require("telescope.actions").close,
						["<CR>"] = require("telescope.actions").select_default,
						-- ["<C-x>"] = require("telescope.actions").select_horizontal,
						-- ["<C-v>"] = require("telescope.actions").select_vertical,
						["<C-t>"] = require("telescope.actions").select_tab,
						["<C-u>"] = require("telescope.actions").preview_scrolling_up,
						["<C-d>"] = require("telescope.actions").preview_scrolling_down,
						-- ["<Tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_worse,
						-- ["<S-Tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_better,
						["<C-_>"] = require("telescope.actions").which_key, -- keys from pressing <C-/>
						-- ["<C-S-p>"] = require("telescope.actions.layout").toggle_preview,
					},
				},
			},
			pickers = {
				find_files = {
					prompt_title = "   Find File",
				},
				lsp_definitions = {
					prompt_title = "   Find Definition",
					include_declaration = false,
					include_current_line = false,
					show_line = false,
				},
				lsp_references = {
					prompt_title = "   LSP References",
					include_declaration = false,
					include_current_line = false,
					show_line = false,
				},
				keymaps = {
					prompt_title = "   Keymaps",
				},
				current_buffer_fuzzy_find = {
					prompt_title = " ﬘  Current Buffer",
				},
				live_grep = {
					prompt_title = "   Live Grep",
				},
				help_tags = {
					prompt_title = "  Help Tags",
				},
				oldfiles = {
					prompt_title = "   Old Files",
				},
				marks = {
					prompt_title = "  Marks",
				},
				buffers = {
					prompt_title = " ﬘ Buffers",
				},
				diagnostics = {
					prompt_title = "  diagnostics",
				},
			},
			extensions = {
				project = {
					theme = "dropdown",
					hidden_files = true,
					-- order_by = "asc",
					base_dirs = {},
					mappings = {},
				},
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case",the default case_mode is "smart_case"
				},
			},
		})
		require("telescope").load_extension("project")
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("smart_history")
	end,
}
