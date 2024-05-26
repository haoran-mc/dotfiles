return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			-- local npairs = require("nvim-autopairs")
			-- local Rule = require("nvim-autopairs.rule")

			require("nvim-autopairs").setup({
				ignored_next_char = [=[[%w%%%'%[%"%.]]=],
				enable_check_bracket_line = false, --- check bracket in same line
				check_ts = true,
				ts_config = {
					lua = { "string" }, -- it will not add a pair on that treesitter node
					javascript = { "template_string" },
					java = false, -- don't check treesitter on java
				},
				fast_wrap = {
					-- not in effect
					map = "<M-e>",
					chars = { "{", "[", "(", '"', "'" },
					pattern = [=[[%'%"%)%>%]%)%}%,]]=],
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					highlight = "Search",
					highlight_grey = "Comment",
				},
			})

			--[[ -- use treesitter to check for a pair
			local ts_conds = require("nvim-autopairs.ts-conds") ]]

			--[[ press % => %% only while inside a comment or string
			npairs.add_rules({
				Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
				Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
			}) ]]
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		opts = {},
	},
	{
		"phaazon/hop.nvim",
		branch = "v2",
		keys = {
			{ "<leader>fj", "<cmd>HopLine<cr>", "n", { noremap = true, silent = true } },
			{ "<leader>fk", "<cmd>HopLine<cr>", "n", { noremap = true, silent = true } },
			{ "<leader>fw", "<cmd>HopWord<cr>", "n", { noremap = true, silent = true } },
			{ "<leader>fa", "<cmd>HopWordMW<cr>", "n", { noremap = true, silent = true } },
		},
		opts = {
			keys = "etovxqpdygfblzhckisuran", -- j m w
		},
	},
}
