-- npm install -g browser-sync
return {
	"ray-x/web-tools.nvim",
	enabled = false,
	ft = {
		"html",
		"css",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"svelte",
		"vue",
		"markdown",
	},
	config = function()
		require("web-tools").setup({
			keymaps = {
				rename = nil, -- by default use same setup of lspconfig
				repeat_rename = ".", -- . to repeat
			},
			hurl = {
				show_headers = false, -- do not show http headers
				floating = false, -- use floating windows (need guihua.lua)
				formatters = {
					json = { "jq" },
					html = { "prettier", "--parser", "html" },
				},
			},
		})
	end,
}
