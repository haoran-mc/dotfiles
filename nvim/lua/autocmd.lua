-- 用 o 换行不要延续注释
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*" },
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions
		- "o" -- O and o, don't continue comments
		+ "r" -- But do continue when pressing enter.
	end,
})

-- 重新打开缓冲区恢复光标位置
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
			vim.fn.setpos(".", vim.fn.getpos("'\""))
			vim.cmd([[silent! foldopen]])
		end
	end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	pattern = "*",
})

-- https://github.com/nvim-telescope/telescope.nvim/issues/559#issuecomment-1074076011
vim.api.nvim_create_autocmd("BufRead", {
	callback = function()
		vim.api.nvim_create_autocmd("BufWinEnter", {
			once = true,
			command = "normal! zx",
		})
	end,
})

-- https://github.com/neovim/nvim-lspconfig/issues/2552#issuecomment-1506704775
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		client.server_capabilities.semanticTokensProvider = nil
	end
})

---------------[[
-- FileType
--]]
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.wrap = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua,json,yaml",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end
})
