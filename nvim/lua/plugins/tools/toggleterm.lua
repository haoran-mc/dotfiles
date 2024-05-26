return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>ot", "<cmd>ToggleTerm direction=tab<cr>", "n", { noremap = true, silent = true } },
		{ "<leader>of", "<cmd>ToggleTerm direction=float<cr>", "n", { noremap = true, silent = true } },
		{ "<leader>ol", "<cmd>ToggleTerm direction=vertical<cr>", "n", { noremap = true, silent = true } },
		{ "<leader>oj", "<cmd>ToggleTerm direction=horizontal<cr>", "n", { noremap = true, silent = true } },
		{
			"<leader>ag",
			function()
				require("toggleterm.terminal").Terminal
					:new({
						cmd = "lazygit",
						hidden = true,
						dir = "git_dir",
						direction = "float",
					})
					:toggle()
			end,
			{ noremap = true, silent = true },
		},
	},
	config = function()
		require("toggleterm").setup({
			-- size can be a number or function which is passed the current terminal
			size = function(term)
				if term.direction == "horizontal" then
					return 10
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			-- open_mapping = [[<c-\>]],
			autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
			direction = "float", --'vertical' | 'horizontal' | 'tab' | 'float',
			shell = vim.o.shell, -- change the default shell
			-- This field is only relevant if direction is set to 'float'
			float_opts = {
				-- The border key is *almost* the same as 'nvim_open_win'
				-- see :h nvim_open_win for details on borders however
				-- the 'curved' border is a custom border type
				-- not natively supported but implemented in this plugin.
				border = "curved", --'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
			},
			winbar = {
				enabled = false,
				name_formatter = function(term) --  term: Terminal
					return term.name
				end,
			},
		})
	end,
}
