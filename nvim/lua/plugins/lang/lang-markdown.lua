-- depend on treesitter, and it's parsers markdown, markdown_inline
return {
	"dhruvasagar/vim-table-mode",
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			command = "TableModeEnable",
		})
	end,
}
