return {
	"X3eRo0/dired.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
    keys = {
        {
            "<leader>dj",
            "<cmd>Dired<CR>",
            "n",
			{ noremap = true, silent = true, desc = "dired mode" },
        },
    },
	config = function()
		require("dired").setup({
			path_separator = "/",
			show_banner = false,
			show_hidden = true,
			show_dot_dirs = true,
			show_colors = true,
		})
	end,
}
