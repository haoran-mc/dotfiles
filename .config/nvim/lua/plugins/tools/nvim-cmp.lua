--[[ local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end ]]

return {
	"hrsh7th/nvim-cmp",                       -- complete engine
	event = { "InsertEnter", "CmdlineEnter" }, -- some times insert lazy than filetype
	dependencies = {
		"onsails/lspkind.nvim",                 -- adds vscode-like pictograms
		"hrsh7th/cmp-nvim-lsp",                 -- lsp completions
		"hrsh7th/cmp-buffer",                   -- buffer completions
		"hrsh7th/cmp-path",                     -- path completions
		"hrsh7th/cmp-cmdline",                  -- cmdline completions
		"hrsh7th/cmp-nvim-lua",                 -- nvim lua api completions
		"saadparwaiz1/cmp_luasnip",             -- snippet engine
		-- "rafamadriz/friendly-snippets",   -- additions to snippets
		{
			"L3MON4D3/LuaSnip", -- snippet completions
			config = function()
				require("luasnip").setup({
					region_check_events = "CursorHold,InsertLeave",
					delete_check_events = "TextChanged,InsertEnter",
				})
				require("luasnip.loaders.from_snipmate").lazy_load()
			end,
		},
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		cmp.setup({
			enabled = function()
				-- disable
				local inList = false
				for _, ft in pairs(Variants.CodeFileTypeList) do
					if vim.bo.filetype == ft then
						inList = true
					end
				end
				if not inList then
					return false
				end

				-- https://github.com/hrsh7th/nvim-cmp/issues/519#issuecomment-1091109258
				local line = vim.api.nvim_get_current_line()
				local cursor = vim.api.nvim_win_get_cursor(0)[2]

				local current = string.sub(line, cursor, cursor + 1)
				local list = { "{", "}", "[", "(", ",", " " }
				for i = 0, #list do
					if list[i] == current then
						return false
					end
				end

				-- https://github.com/nvim-telescope/telescope.nvim/issues/94
				-- disable completion in comments
				local context = require("cmp.config.context")
				-- keep command mode completion enabled when cursor is in a comment
				if
						not vim.api.nvim_get_mode().mode == "c"
						and (context.in_treesitter_capture("comment") or context.in_syntax_group("Comment"))
				then
					return false
				end
				if vim.bo.filetype == "TelescopePrompt" or vim.bo.filetype == "neo-tree-popup" then
					return false
				end
				return true
			end,
			window = {
				documentation = cmp.config.window.bordered(),
				complete = cmp.config.window.bordered(),
				completion = {
					scrolloff = 5,
					-- border = 'rounded',
				},
			},
			completion = {
				-- https://zhuanlan.zhihu.com/p/106070272
				completeopt = "menu,menuone,noselect",
			},
			experimental = {
				ghost_text = true,
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<Tab>"] = cmp.mapping(function(fallback)
					if luasnip.expand_or_jumpable() then -- 先进行扩展
						luasnip.expand_or_jump()
					elseif cmp.visible() then       -- 如果存在补全窗口
						cmp.select_next_item()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "path" },
				{ name = "buffer" },
			}),
			formatting = {
				format = require("lspkind").cmp_format({
					mode = "symbol_text",
					with_text = true,
					maxwidth = 50,
					before = function(entry, vim_item)
						vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
						return vim_item
					end,
				}),
			},
			sorting = {
				priority_weight = 2,
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					-- cmp.config.compare.scopes,
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					cmp.config.compare.locality,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
		})
		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})
		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		-- [`wsl``:! command` make neovim no response](https://github.com/hrsh7th/cmp-cmdline/issues/24#issuecomment-1094896592)
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
		})
	end,
}
