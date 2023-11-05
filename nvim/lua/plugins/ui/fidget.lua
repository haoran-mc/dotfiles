-- 右下角 nvim-lsp 进程独立界面
return {
	"j-hui/fidget.nvim",
    lazy = true,
    tag = "legacy",
    dependencies = {
        "neovim/nvim-lspconfig"
    },
	config = function()
		require("fidget").setup({
			window = {
				relative = "win", -- where to anchor, either "win" or "editor"
				blend = 0, -- &winblend for the window
				zindex = 20, -- the zindex value for the window
				border = "none", -- style of border for the fidget window
			},
			sources = { -- Sources to configure
				["null-ls"] = { -- Name of source
					ignore = true, -- Ignore notifications from this source
				},
			},
		})
	end,
}
