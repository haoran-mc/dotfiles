return {
	{
		"ianva/vim-youdao-translater",
		keys = {
			{ "<leader>af", "<cmd>Ydc<cr>", "n", { noremap = true, silent = true } },
		},
	},
	{
		"haoran-mc/interestingwords.nvim", -- <leader>k
		config = function()
			require("interestingwords").setup {
				colors = { '#A4E57E', '#8CCBEA', '#FFDB72', '#ff0000', '#FFB3FF', '#aeee00' },
				-- colors = { '#FF7272', '#b88823', '#ffa724', '#ff2c4b' },
				color_key = "<leader>k",
				cancel_color_key = "<leader>K",
			}
		end
	}
}
