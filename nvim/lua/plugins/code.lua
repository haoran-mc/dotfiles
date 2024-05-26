return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("Comment").setup({
				---Add a space b/w comment and the line
				padding = true,
				---Whether the cursor should stay at its position
				sticky = true,
				---Lines to be ignored while (un)comment
				ignore = "^$",
				---LHS of toggle mappings in NORMAL mode
				toggler = {
					---Line-comment toggle keymap
					line = "gcc",
					---Block-comment toggle keymap
					block = "gcb",
				},
				---LHS of operator-pending mappings in NORMAL and VISUAL mode
				opleader = {
					---Line-comment keymap
					line = "gc",
					---Block-comment keymap
					block = "gb",
				},
				---LHS of extra mappings
				extra = {
					---Add comment on the line above
					above = "gcO",
					---Add comment on the line below
					below = "gco",
					---Add comment at the end of line
					eol = "gcA",
				},
				---Enable keybindings
				---NOTE: If given `false` then the plugin won't create any mappings
				mappings = {
					---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
					basic = true,
					---Extra mapping; `gco`, `gcO`, `gcA`
					extra = false,
					---Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
					extended = false,
				},
				--[[ -Function to call before (un)comment
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
				-Function to call after (un)comment
				post_hook = function(ctx)
					local U = require('Comment.utils')
					local srow = ctx.range.erow
					local erow = srow + 1
					local line = U.get_lines({ srow = srow, erow = erow })
					local _, col = U.grab_indent(line[1])
					vim.api.nvim_win_set_cursor(0, { erow, col })
				end, ]]
			})
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		keys = {
			{ "<leader>cs", "<cmd>SymbolsOutline<cr>", "n", { silent = true } },
		},
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		ft = { "lua", "yaml", "python" },
		config = function()
			require("conform").setup({
				format_after_save = {
					lsp_fallback = true,
				},
				log_level = vim.log.levels.ERROR,
				notify_on_error = true,
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					go = { "goimports", "gofumpt" },
					-- Use a sub-list to run only the first available formatter
					javascript = { { "prettierd", "prettier" } },
					-- You can use a function here to determine the formatters dynamically
					python = function(bufnr)
						if require("conform").get_formatter_info("ruff_format", bufnr).available then
							return { "isort", "ruff_format" }
						else
							return { "isort", "black" }
						end
					end,
					json = { "jq" },
					-- Use the "*" filetype to run formatters on all filetypes.
					["*"] = { "codespell" },
					-- Use the "_" filetype to run formatters on filetypes that don't
					-- have other formatters configured.
					["_"] = { "trim_whitespace" },
				},
			})
		end,
	},
}
