--[[ https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization

To instead override float border setting globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	local border = {
		{ "┌", "FloatBorder" },
		{ "─", "FloatBorder" },
		{ "┐", "FloatBorder" },
		{ "│", "FloatBorder" },
		{ "┘", "FloatBorder" },
		{ "─", "FloatBorder" },
		{ "└", "FloatBorder" },
		{ "│", "FloatBorder" },
	}
	opts = opts or {}
	opts.border = opts.border or border

	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end ]]

local utils = require("utils")

vim.diagnostic.config({
	virtual_text = { prefix = "", source = "always" }, -- prefix：'●', '▎', 'x'
	float = { source = "always" },
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

PositionStack = {}

function LspJump()
	local currentPosition = vim.fn.winsaveview()
	currentPosition.bufnr = vim.fn.bufnr()
	table.insert(PositionStack, currentPosition)
	vim.cmd("Telescope lsp_definitions")
end

function LspJumpBack()
	if #PositionStack == 0 then
		print("position stack is empty")
		return
	end
	local position = table.remove(PositionStack)
	vim.cmd("buffer " .. position.bufnr)
	vim.fn.winrestview(position)
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		-- "jay-babu/mason-null-ls.nvim",
		-- "folke/neodev.nvim", -- full signature help
		"nvim-telescope/telescope.nvim",
		"stevearc/dressing.nvim", -- input box for rename
		"j-hui/fidget.nvim",
	},
	config = function()
		-- local lsp_signature = require("lsp_signature")
		local my_capabilities = vim.lsp.protocol.make_client_capabilities()

		my_capabilities.textDocument.completion.completionItem.snippetSupport = true
		my_capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
		my_capabilities.textDocument.completion.completionItem.preselectSupport = true
		my_capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
		my_capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
		my_capabilities.textDocument.completion.completionItem.deprecatedSupport = true
		my_capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
		my_capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
		my_capabilities.textDocument.completion.completionItem.resolveSupport = {
			properties = {
				"documentation",
				"detail",
				"additionalTextEdits",
			},
		}

		vim.keymap.set(
			"n",
			"gf",
			vim.diagnostic.open_float,
			{ noremap = true, silent = true, desc = "diagnostic open float" }
		)

		vim.keymap.set(
			"n",
			"g[",
			vim.diagnostic.goto_prev,
			{ noremap = true, silent = true, desc = "diagnostic goto prev" }
		)

		vim.keymap.set(
			"n",
			"g]",
			vim.diagnostic.goto_next,
			{ noremap = true, silent = true, desc = "diagnostic goto next" }
		)

		-- custom on_attach
		local my_attach = function(_, bufnr)
			vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
			-- lsp_signature.on_attach(client, bufnr)
			-- Mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			vim.keymap.set("n", "gd", LspJump, { noremap = true, silent = true })

			vim.keymap.set("n", "gb", LspJumpBack, { noremap = true, silent = true })

			-- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>",
			-- { noremap = true, silent = true })

			vim.keymap.set(
				"n",
				"gi",
				"<cmd>Telescope lsp_implementations<cr>", -- vim.lsp.buf.implementation
				{ noremap = true, silent = true, buffer = true, desc = "goto implementation" }
			)

			vim.keymap.set(
				"n",
				"gl",
				"<cmd>Telescope diagnostics<cr>",
				{ noremap = true, silent = true, buffer = true, desc = "diagnostics" }
			)

			vim.keymap.set("n", "gp", function()
				local params = vim.lsp.util.make_position_params()
				return vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result)
					if result == nil or vim.tbl_isempty(result) then
						return
					end
					vim.lsp.util.preview_location(result[1])
				end)
			end, { noremap = true, silent = true, buffer = bufnr, desc = "preview definition" })

			vim.keymap.set(
				"n",
				"gD",
				vim.lsp.buf.type_definition,
				{ noremap = true, silent = true, buffer = bufnr, desc = "type definition" }
			)

			vim.keymap.set(
				"n",
				"gr",
				"<cmd>Telescope lsp_references <cr>",
				{ noremap = true, silent = true, buffer = bufnr, desc = "lsp_references" }
			)

			vim.keymap.set(
				"n",
				"K",
				vim.lsp.buf.hover,
				{ noremap = true, silent = true, buffer = bufnr, desc = "hover doc" }
			)

			vim.keymap.set(
				"n",
				"<leader>cr",
				vim.lsp.buf.rename,
				{ noremap = true, silent = true, buffer = bufnr, desc = "rename" }
			)

			vim.keymap.set(
				"n",
				"<leader>ca",
				vim.lsp.buf.code_action,
				{ noremap = true, silent = true, buffer = bufnr, desc = "code action" }
			)

			vim.keymap.set(
				"n",
				"<leader>cf",
				"<cmd>lua vim.lsp.buf.format { async = true }<cr>",
				{ noremap = true, silent = true, buffer = bufnr, desc = "format" }
			)
		end

		-- require("neodev").setup()

		-- lua_ls(offcial) or sumneko_lua(communal)
		require("lspconfig").lua_ls.setup({
			capabilities = my_capabilities,
			on_attach = my_attach,
			cmd = { "lua-language-server", "--locale=zh-cn" },
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
						autoRequire = false,
					},
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
						disable = {
							"redefined-local",
						},
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
						-- https://github.com/neovim/nvim-lspconfig/issues/1700#issuecomment-1356282825
						checkThirdParty = false,
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})
		require("lspconfig").gopls.setup({
			capabilities = my_capabilities,
			on_attach = my_attach,
		})
		require("lspconfig").bashls.setup({
			capabilities = my_capabilities,
			on_attach = my_attach,
		})
		require("lspconfig").sqlls.setup({
			capabilities = my_capabilities,
			on_attach = my_attach,
		})

		if utils.executable("pylsp") then
			local venv_path = os.getenv("VIRTUAL_ENV")
			local py_path = nil
			-- decide which python executable to use for mypy
			if venv_path ~= nil then
				py_path = venv_path .. "/bin/python3"
			else
				-- py_path = vim.g.python3_host_prog
				py_path = "/Users/haoran/.pyenv/shims/python3"
			end
			require("lspconfig").pylsp.setup({
				capabilities = my_capabilities,
				on_attach = my_attach,
				settings = {
					-- https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
					pylsp = {
						plugins = {
							-- formatter options, format by conform.nvim
							black = { enabled = false },
							autopep8 = { enabled = false },
							yapf = { enabled = false },
							-- import sorting, sort imports by conform.nvim
							isort = { enabled = false },
							-- linter options
							pylint = {
								enabled = true,
								executable = "pylint", -- manual download, on your PATH pip install pylint/pylint-venv
							},
							ruff = { enabled = false }, -- ruff can format and lint
							pyflakes = { enabled = false },
							pycodestyle = { enabled = false },
							-- type checker
							pylsp_mypy = {
								enabled = true,
								overrides = { "--python-executable", py_path, true },
								report_progress = true,
								live_mode = false,
							},
							-- auto-completion options
							jedi_completion = { fuzzy = true },
						},
					},
				},
				flags = {
					debounce_text_changes = 200,
				},
			})
		else
			vim.notify("pylsp not found!", vim.log.levels.WARN, { title = "nvim-config" })
		end

		require("lspconfig").clangd.setup({
			capabilities = my_capabilities,
			on_attach = my_attach,
			-- https://www.reddit.com/r/neovim/comments/12qbcua/comment/jgpqxsp
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
			},
		})
		require("lspconfig").cmake.setup({
			capabilities = my_capabilities,
			on_attach = my_attach,
		})
		require("lspconfig").jsonls.setup({
			on_attach = my_attach,
			capabilities = my_capabilities,
		})
		require("lspconfig").html.setup({
			on_attach = my_attach,
			capabilities = my_capabilities,
		})
		require("lspconfig").cssls.setup({
			on_attach = my_attach,
			capabilities = my_capabilities,
		})
		require("lspconfig").eslint.setup({
			on_attach = my_attach,
			capabilities = my_capabilities,
		})
	end,
}
