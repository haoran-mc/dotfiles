return {
	"fatih/vim-go",
	init = function()
        vim.g['go_def_mapping_enabled'] = 0
        vim.g['go_fmt_command'] = 'goimports'
	end,
}
