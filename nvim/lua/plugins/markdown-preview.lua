return {
	"iamcco/markdown-preview.nvim",
	build = "cd app && npm install",
	ft = "markdown",
    keys = {
        { "<leader>mp", "<cmd>MarkdownPreview<cr>", "n", { silent = true } },
    },
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
}
