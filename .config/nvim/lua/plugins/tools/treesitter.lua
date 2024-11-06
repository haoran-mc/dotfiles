return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function()
		-- https://github.com/p00f/nvim-ts-rainbow/issues/81#issuecomment-1058124957
		local rainbow = { "#CC8888", "#CCCC88", "#88CC88", "#88CCCC", "#8888CC", "#CC88CC" }
		for i, c in ipairs(rainbow) do -- p00f/rainbow#81
			vim.cmd(("hi rainbowcol%d guifg=%s"):format(i, c))
		end

		require("nvim-treesitter.install").prefer_git = true

		require("nvim-treesitter.configs").setup({
			parser_install_dir = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter",
			auto_install = true,
			sync_install = false,
			ensure_installed = {
				"lua",
				"python",
				"go",
				"json",
				"c",
				"cpp",
			},
			ignore_install = {},
			highlight = {
				enable = true,

				disable = function(lang, buf)
					local disable_lang = { "markdown" }
					for _, v in ipairs(disable_lang) do
						if v == lang then
							return true
						end
					end

					-- disable while big file
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = false, -- use flash <leader>v instead
			},
			indent = {    -- experimental feature
				enable = false,
			},
		})

		-- winbar
		require("treesitter-context").setup({
			enable = false,     -- Enable this plugin (Can be enabled/disabled later via commands)
			max_lines = 0,      -- How many lines the window should span. Values <= 0 mean no limit.
			trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
			min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
			zindex = 20,        -- The Z-index of the context window
			mode = "topline",   -- Line used to calculate context. Choices: 'cursor', 'topline'
			-- Separator between context and content. Should be a single character string, like '-'.
			-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
			separator = nil,
		})
	end,
}
