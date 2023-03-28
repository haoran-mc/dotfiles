return {
    "phaazon/hop.nvim",
    branch = 'v2',
    keys = {
		{ "<leader>fj", "<cmd>HopLine<cr>", "n", { noremap = true, silent = true } },
		{ "<leader>fk", "<cmd>HopLine<cr>", "n", { noremap = true, silent = true } },
		{ "<leader>fw", "<cmd>HopWord<cr>", "n", { noremap = true, silent = true } },
		{ "<leader>fa", "<cmd>HopWordMW<cr>", "n", { noremap = true, silent = true } },
		{ "<leader>fh", "<cmd>HopWordCurrentLineBC<cr>", "n", { noremap = true, silent = true } },
		{ "<leader>fl", "<cmd>HopWordCurrentLineAC<cr>", "n", { noremap = true, silent = true } },
    },
    config = function ()
        require("hop").setup({
            keys = 'etovxqpdygfblzhckisuran', -- j m w
        })
    end,
}
